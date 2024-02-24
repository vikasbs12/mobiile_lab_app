// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [chipviewfortythree_item_widget] screen.
class ChipviewfortythreeItemModel extends Equatable {
  ChipviewfortythreeItemModel({
    this.m,
    this.isSelected,
  }) {
    m = m ?? "M";
    isSelected = isSelected ?? false;
  }

  String? m;

  bool? isSelected;

  ChipviewfortythreeItemModel copyWith({
    String? m,
    bool? isSelected,
  }) {
    return ChipviewfortythreeItemModel(
      m: m ?? this.m,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [m, isSelected];
}
