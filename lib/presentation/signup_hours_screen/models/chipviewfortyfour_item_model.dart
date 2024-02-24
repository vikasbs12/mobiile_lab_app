// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [chipviewfortyfour_item_widget] screen.
class ChipviewfortyfourItemModel extends Equatable {
  ChipviewfortyfourItemModel({
    this.amam,
    this.isSelected,
  }) {
    amam = amam ?? "8:00am - 10:00am";
    isSelected = isSelected ?? false;
  }

  String? amam;

  bool? isSelected;

  ChipviewfortyfourItemModel copyWith({
    String? amam,
    bool? isSelected,
  }) {
    return ChipviewfortyfourItemModel(
      amam: amam ?? this.amam,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [amam, isSelected];
}
