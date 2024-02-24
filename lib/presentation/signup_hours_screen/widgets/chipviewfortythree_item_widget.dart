import 'package:flutter/material.dart';
import 'package:mobiile_lab/core/app_export.dart';
import '../models/chipviewfortythree_item_model.dart';

// ignore: must_be_immutable
class ChipviewfortythreeItemWidget extends StatelessWidget {
  ChipviewfortythreeItemWidget(
    this.chipviewfortythreeItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  ChipviewfortythreeItemModel chipviewfortythreeItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 6.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipviewfortythreeItemModelObj.m!,
        style: TextStyle(
          color: (chipviewfortythreeItemModelObj.isSelected ?? false)
              ? appTheme.whiteA700
              : theme.colorScheme.primaryContainer.withOpacity(0.3),
          fontSize: 16.fSize,
          fontFamily: 'Be Vietnam',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (chipviewfortythreeItemModelObj.isSelected ?? false),
      backgroundColor: appTheme.whiteA700,
      selectedColor: theme.colorScheme.primary,
      shape: (chipviewfortythreeItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                8.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide(
                color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                width: 1.h,
              ),
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
