import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/chipviewfortythree_item_model.dart';
import '../models/chipviewfortyfour_item_model.dart';
import 'package:mobiile_lab/presentation/signup_hours_screen/models/signup_hours_model.dart';
part 'signup_hours_event.dart';
part 'signup_hours_state.dart';

/// A bloc that manages the state of a SignupHours according to the event that is dispatched to it.
class SignupHoursBloc extends Bloc<SignupHoursEvent, SignupHoursState> {
  SignupHoursBloc(SignupHoursState initialState) : super(initialState) {
    on<SignupHoursInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
    on<UpdateChipView1Event>(_updateChipView1);
  }

  _onInitialize(
    SignupHoursInitialEvent event,
    Emitter<SignupHoursState> emit,
  ) async {
    emit(state.copyWith(
        signupHoursModelObj: state.signupHoursModelObj?.copyWith(
      chipviewfortythreeItemList: fillChipviewfortythreeItemList(),
      chipviewfortyfourItemList: fillChipviewfortyfourItemList(),
    )));
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<SignupHoursState> emit,
  ) {
    List<ChipviewfortythreeItemModel> newList =
        List<ChipviewfortythreeItemModel>.from(
            state.signupHoursModelObj!.chipviewfortythreeItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(state.copyWith(
        signupHoursModelObj: state.signupHoursModelObj
            ?.copyWith(chipviewfortythreeItemList: newList)));
  }

  _updateChipView1(
    UpdateChipView1Event event,
    Emitter<SignupHoursState> emit,
  ) {
    List<ChipviewfortyfourItemModel> newList =
        List<ChipviewfortyfourItemModel>.from(
            state.signupHoursModelObj!.chipviewfortyfourItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(state.copyWith(
        signupHoursModelObj: state.signupHoursModelObj
            ?.copyWith(chipviewfortyfourItemList: newList)));
  }

  List<ChipviewfortythreeItemModel> fillChipviewfortythreeItemList() {
    return List.generate(7, (index) => ChipviewfortythreeItemModel());
  }

  List<ChipviewfortyfourItemModel> fillChipviewfortyfourItemList() {
    return List.generate(5, (index) => ChipviewfortyfourItemModel());
  }
}
