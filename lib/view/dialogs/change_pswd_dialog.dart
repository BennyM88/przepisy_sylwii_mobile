import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/change_pswd_cubit/change_pswd_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/utils/snackbar.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_text_field.dart';

class ChangePswdDialog extends StatefulWidget {
  final String email;

  const ChangePswdDialog({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<ChangePswdDialog> createState() => _ChangePswdDialogState();
}

class _ChangePswdDialogState extends State<ChangePswdDialog> {
  final TextEditingController currentPswdController = TextEditingController();
  final TextEditingController newPswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: BlocConsumer<ChangePswdCubit, ChangePswdState>(
        listener: (_, state) => state.whenOrNull(
          success: () async {
            displaySnackBar('Hasło zostało zmienione');
            Navigator.pop(context);
            return null;
          },
        ),
        builder: (_, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Podaj aktualne hasło',
                style: CustomTypography.uRegular14,
              ),
              SizedBox(height: 8.h),
              state.maybeWhen(
                loading: () => CustomTextField(
                  textEditingController: currentPswdController,
                  hintText: 'Aktualne',
                  isPassword: true,
                  isEnabled: false,
                ),
                orElse: () => CustomTextField(
                  textEditingController: currentPswdController,
                  hintText: 'Aktualne',
                  isPassword: true,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Podaj nowe hasło',
                style: CustomTypography.uRegular14,
              ),
              SizedBox(height: 8.h),
              state.maybeWhen(
                loading: () => CustomTextField(
                  textEditingController: newPswdController,
                  hintText: 'Nowe',
                  isPassword: true,
                  isEnabled: false,
                ),
                orElse: () => CustomTextField(
                  textEditingController: newPswdController,
                  hintText: 'Nowe',
                  isPassword: true,
                ),
              ),
              SizedBox(height: 24.h),
              state.maybeWhen(
                error: (e) => Center(
                  child: Text(
                    e.toString(),
                    style: CustomTypography.uRegular12red,
                  ),
                ),
                orElse: () => const SizedBox(),
              ),
              SizedBox(height: 24.h),
              state.maybeWhen(
                loading: () => CustomButton.loaderPink(),
                orElse: () => CustomButton(
                  content: 'Zmień',
                  onPressed: () async =>
                      getIt<ChangePswdCubit>().changePassword(
                    widget.email,
                    currentPswdController.text.trim(),
                    newPswdController.text.trim(),
                  ),
                  isPink: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    currentPswdController.dispose();
    newPswdController.dispose();
    super.dispose();
  }
}
