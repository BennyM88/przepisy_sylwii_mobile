import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/register_cubit/register_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_text_field.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/top_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pswdController = TextEditingController();
  final TextEditingController rePswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 48.h),
                const TopBar(content: 'Rejestracja'),
                SizedBox(height: 48.h),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (_, state) => state.whenOrNull(
                    success: () => Navigator.pop(context),
                  ),
                  builder: (_, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Podaj nam swoje',
                          style: CustomTypography.uRegular14,
                        ),
                        SizedBox(height: 10.h),
                        state.maybeWhen(
                          loading: () => CustomTextField(
                            textEditingController: nameController,
                            hintText: 'Imie',
                            isEnabled: false,
                          ),
                          orElse: () => CustomTextField(
                            textEditingController: nameController,
                            hintText: 'Imie',
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          'Podaj nam swojego',
                          style: CustomTypography.uRegular14,
                        ),
                        SizedBox(height: 10.h),
                        state.maybeWhen(
                          loading: () => CustomTextField(
                            textEditingController: emailController,
                            hintText: 'Email',
                            isEnabled: false,
                          ),
                          orElse: () => CustomTextField(
                            textEditingController: emailController,
                            hintText: 'Email',
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          'Podaj nam swoje',
                          style: CustomTypography.uRegular14,
                        ),
                        SizedBox(height: 10.h),
                        state.maybeWhen(
                          loading: () => CustomTextField(
                            textEditingController: pswdController,
                            hintText: 'Hasło',
                            isPassword: true,
                            isEnabled: false,
                          ),
                          orElse: () => CustomTextField(
                            textEditingController: pswdController,
                            hintText: 'Hasło',
                            isPassword: true,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          'Powtórz swoje',
                          style: CustomTypography.uRegular14,
                        ),
                        SizedBox(height: 10.h),
                        state.maybeWhen(
                          loading: () => CustomTextField(
                            textEditingController: rePswdController,
                            hintText: 'Hasło',
                            isPassword: true,
                            isEnabled: false,
                          ),
                          orElse: () => CustomTextField(
                            textEditingController: rePswdController,
                            hintText: 'Hasło',
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
                          loading: () => CustomButton.loader(),
                          orElse: () => CustomButton(
                            content: 'Zarejestruj',
                            onPressed: () async => validateAndRegister(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 24.h),
                const _BottomInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> validateAndRegister() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String pswd = pswdController.text.trim();
    String rePswd = rePswdController.text.trim();

    if (name.isEmpty || email.isEmpty || pswd.isEmpty || rePswd.isEmpty) {
      getIt<RegisterCubit>().emitError('Pola nie mogą być puste');
      return;
    }

    if (pswd != rePswd) {
      getIt<RegisterCubit>().emitError('Hasła się nie pokrywają');
      return;
    }

    getIt<RegisterCubit>().register(
      name,
      email,
      pswd,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pswdController.dispose();
    rePswdController.dispose();
    super.dispose();
  }
}

class _BottomInfo extends StatelessWidget {
  const _BottomInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Posiadasz już konto? ',
          style: CustomTypography.uRegular14,
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            'Zaloguj się',
            style: CustomTypography.uBold14,
          ),
        ),
      ],
    );
  }
}
