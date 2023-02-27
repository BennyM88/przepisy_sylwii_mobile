import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/category_list.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';

class PickCategorySection extends StatefulWidget {
  final Function(String) categoryCallback;

  const PickCategorySection({super.key, required this.categoryCallback});

  @override
  State<PickCategorySection> createState() => _PickCategorySectionState();
}

class _PickCategorySectionState extends State<PickCategorySection> {
  String _categoryValue = 'Obiad';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: CustomColors.neutral95,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _categoryValue,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: categoryList
              .map(
                (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: (String? newValue) {
            widget.categoryCallback(newValue!);
            if (mounted) {
              setState(() {
                _categoryValue = newValue;
              });
            }
          },
        ),
      ),
    );
  }
}
