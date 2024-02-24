// ignore_for_file: must_be_immutable

part of 'signup_bloc.dart';

/// Represents the state of Signup in the application.
class SignupState extends Equatable {
  SignupState({
    this.fullNameSectionController,
    this.emailSectionController,
    this.phoneNumberSectionController,
    this.passwordSectionController,
    this.confirmPasswordSectionController,
    this.signupModelObj,
  });

  TextEditingController? fullNameSectionController;

  TextEditingController? emailSectionController;

  TextEditingController? phoneNumberSectionController;

  TextEditingController? passwordSectionController;

  TextEditingController? confirmPasswordSectionController;

  SignupModel? signupModelObj;

  @override
  List<Object?> get props => [
        fullNameSectionController,
        emailSectionController,
        phoneNumberSectionController,
        passwordSectionController,
        confirmPasswordSectionController,
        signupModelObj,
      ];

  SignupState copyWith({
    TextEditingController? fullNameSectionController,
    TextEditingController? emailSectionController,
    TextEditingController? phoneNumberSectionController,
    TextEditingController? passwordSectionController,
    TextEditingController? confirmPasswordSectionController,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      fullNameSectionController:
          fullNameSectionController ?? this.fullNameSectionController,
      emailSectionController:
          emailSectionController ?? this.emailSectionController,
      phoneNumberSectionController:
          phoneNumberSectionController ?? this.phoneNumberSectionController,
      passwordSectionController:
          passwordSectionController ?? this.passwordSectionController,
      confirmPasswordSectionController: confirmPasswordSectionController ??
          this.confirmPasswordSectionController,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}
