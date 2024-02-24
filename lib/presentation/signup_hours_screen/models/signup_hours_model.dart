// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'chipviewfortythree_item_model.dart';
import 'chipviewfortyfour_item_model.dart';

/// This class defines the variables used in the [signup_hours_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SignupHoursModel extends Equatable {
  SignupHoursModel({
    this.chipviewfortythreeItemList = const [],
    this.chipviewfortyfourItemList = const [],
  }) {}

  List<ChipviewfortythreeItemModel> chipviewfortythreeItemList;

  List<ChipviewfortyfourItemModel> chipviewfortyfourItemList;

  SignupHoursModel copyWith({
    List<ChipviewfortythreeItemModel>? chipviewfortythreeItemList,
    List<ChipviewfortyfourItemModel>? chipviewfortyfourItemList,
  }) {
    return SignupHoursModel(
      chipviewfortythreeItemList:
          chipviewfortythreeItemList ?? this.chipviewfortythreeItemList,
      chipviewfortyfourItemList:
          chipviewfortyfourItemList ?? this.chipviewfortyfourItemList,
    );
  }

  @override
  List<Object?> get props =>
      [chipviewfortythreeItemList, chipviewfortyfourItemList];
}
