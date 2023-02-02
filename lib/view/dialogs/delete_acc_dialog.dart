import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/delete_acc_cubit/delete_acc_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/utils/snackbar.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';

class DeleteAccDialog extends StatelessWidget {
  const DeleteAccDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Czy na pewno chcesz usunąć swoje konto?',
            style: CustomTypography.uRegular16,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          BlocConsumer<DeleteAccCubit, DeleteAccState>(
            listener: (_, state) => state.whenOrNull(
              error: (errorMessage) async =>
                  displaySnackBar(errorMessage.toString()),
              success: () async {
                displaySnackBar('Konto zostało usunięte');
                Navigator.popUntil(context, (route) => route.isFirst);
                return null;
              },
            ),
            builder: (_, state) => state.maybeWhen(
              loading: () => CustomButton.loaderPink(),
              orElse: () => CustomButton(
                content: 'Tak',
                onPressed: () async => getIt<DeleteAccCubit>().deleteAccount(),
                isPink: true,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          CustomButton(
            content: 'Nie',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
