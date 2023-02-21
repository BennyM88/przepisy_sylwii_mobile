import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:przepisy_sylwii_mobile/services/firebase_crashlytics/firebase_crashlytics.dart';

part 'add_photo_state.dart';
part 'add_photo_cubit.freezed.dart';

@singleton
class AddPhotoCubit extends Cubit<AddPhotoState> {
  AddPhotoCubit() : super(const AddPhotoState.initial());

  Future<void> uploadPhoto(ImageSource imageSource) async {
    if (state is _Loading) return;
    emit(const AddPhotoState.loading());

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference ref = FirebaseStorage.instance.ref();
    final Reference childRef = ref.child('$uniqueFileName.jpg');

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);

    if (image != null) {
      File file = File(image.path);

      try {
        TaskSnapshot taskSnapshot = await childRef.putFile(file);
        String photoUrl = await taskSnapshot.ref.getDownloadURL();
        emit(AddPhotoState.success(imageUrl: photoUrl));
      } on Exception catch (e, st) {
        FirebaseCrashlyticsService.recordError(e, st);
        emit(const AddPhotoState.error());
      }
    }
  }

  Future<void> deletePhoto() async {
    emit(const AddPhotoState.initial());
  }
}
