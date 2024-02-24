import 'package:flutter/material.dart';
import 'package:mobiile_lab/core/app_export.dart';
import '../models/chipviewfortyfour_item_model.dart';

// ignore: must_be_immutable
class ChipviewfortyfourItemWidget extends StatelessWidget {
  ChipviewfortyfourItemWidget(
    this.chipviewfortyfourItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  ChipviewfortyfourItemModel chipviewfortyfourItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 13.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipviewfortyfourItemModelObj.amam!,
        style: TextStyle(
          color: theme.colorScheme.primaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'Be Vietnam',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (chipviewfortyfourItemModelObj.isSelected ?? false),
      backgroundColor: theme.colorScheme.primaryContainer,
      selectedColor: appTheme.orange200,
      shape: (chipviewfortyfourItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                8.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                8.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
