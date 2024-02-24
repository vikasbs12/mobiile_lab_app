// ignore_for_file: must_be_immutable

part of 'signup_farm_info_bloc.dart';

/// Represents the state of SignupFarmInfo in the application.
class SignupFarmInfoState extends Equatable {
  SignupFarmInfoState({
    this.farmerEatsController,
    this.signupOfFourController,
    this.farmInfoController,
    this.nameController,
    this.fortySixController,
    this.selectedDropDownValue,
    this.signupFarmInfoModelObj,
  });

  TextEditingController? farmerEatsController;

  TextEditingController? signupOfFourController;

  TextEditingController? farmInfoController;

  TextEditingController? nameController;

  TextEditingController? fortySixController;

  SelectionPopupModel? selectedDropDownValue;

  SignupFarmInfoModel? signupFarmInfoModelObj;

  @override
  List<Object?> get props => [
        farmerEatsController,
        signupOfFourController,
        farmInfoController,
        nameController,
        fortySixController,
        selectedDropDownValue,
        signupFarmInfoModelObj,
      ];

  SignupFarmInfoState copyWith({
    TextEditingController? farmerEatsController,
    TextEditingController? signupOfFourController,
    TextEditingController? farmInfoController,
    TextEditingController? nameController,
    TextEditingController? fortySixController,
    SelectionPopupModel? selectedDropDownValue,
    SignupFarmInfoModel? signupFarmInfoModelObj,
  }) {
    return SignupFarmInfoState(
      farmerEatsController: farmerEatsController ?? this.farmerEatsController,
      signupOfFourController:
          signupOfFourController ?? this.signupOfFourController,
      farmInfoController: farmInfoController ?? this.farmInfoController,
      nameController: nameController ?? this.nameController,
      fortySixController: fortySixController ?? this.fortySixController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      signupFarmInfoModelObj:
          signupFarmInfoModelObj ?? this.signupFarmInfoModelObj,
    );
  }
}
