import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/amount_cubit/amount_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';

class AmountSection extends StatelessWidget {
  const AmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => getIt<AmountCubit>().decrement(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(CustomColors.neutral00),
          ),
          child: Icon(
            Icons.remove,
            color: CustomColors.neutral100,
            size: 24.sp,
          ),
        ),
        SizedBox(width: 24.w),
        BlocBuilder<AmountCubit, int>(
          builder: (_, state) => Text(
            state.toString(),
            style: CustomTypography.uRegular18,
          ),
        ),
        SizedBox(width: 24.w),
        ElevatedButton(
          onPressed: () => getIt<AmountCubit>().increment(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(CustomColors.neutral00),
          ),
          child: Icon(
            Icons.add,
            color: CustomColors.neutral100,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
