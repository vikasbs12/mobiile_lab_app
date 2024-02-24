import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:mobiile_lab/presentation/signup_farm_info_screen/models/signup_farm_info_model.dart';
part 'signup_farm_info_event.dart';
part 'signup_farm_info_state.dart';

/// A bloc that manages the state of a SignupFarmInfo according to the event that is dispatched to it.
class SignupFarmInfoBloc
    extends Bloc<SignupFarmInfoEvent, SignupFarmInfoState> {
  SignupFarmInfoBloc(SignupFarmInfoState initialState) : super(initialState) {
    on<SignupFarmInfoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<SignupFarmInfoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _onInitialize(
    SignupFarmInfoInitialEvent event,
    Emitter<SignupFarmInfoState> emit,
  ) async {
    emit(state.copyWith(
      farmerEatsController: TextEditingController(),
      signupOfFourController: TextEditingController(),
      farmInfoController: TextEditingController(),
      nameController: TextEditingController(),
      fortySixController: TextEditingController(),
    ));
    emit(state.copyWith(
        signupFarmInfoModelObj: state.signupFarmInfoModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
    )));
  }
}
