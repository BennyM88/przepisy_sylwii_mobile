import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/add_photo_cubit/add_photo_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/dialogs/add_photo_dialog.dart';
import 'package:przepisy_sylwii_mobile/view/utils/snackbar.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/cached_image.dart';

class AddPhotoSection extends StatelessWidget {
  const AddPhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => showModalBottomSheet(
        context: context,
        builder: (_) => const AddPhotoDialog(),
      ),
      child: Container(
        height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: BlocConsumer<AddPhotoCubit, AddPhotoState>(
          listener: (_, state) => state.whenOrNull(
            error: () async => displaySnackBar('Coś poszło nie tak'),
          ),
          builder: (_, state) => state.maybeWhen(
            success: (imageUrl) => InkWell(
              onDoubleTap: () async => getIt<AddPhotoCubit>().deletePhoto(),
              child: CachedImage(
                url: imageUrl,
                height: 200,
                width: double.infinity,
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: CustomColors.neutral00,
              ),
            ),
            orElse: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_camera_outlined,
                  color: CustomColors.neutral40,
                  size: 28.sp,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Dodaj zdjęcie',
                  style: CustomTypography.uRegular14n40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
