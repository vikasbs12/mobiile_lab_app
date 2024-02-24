import 'package:flutter/material.dart';
import 'package:mobiile_lab/core/app_export.dart';
import 'package:mobiile_lab/core/utils/validation_functions.dart';
import 'package:mobiile_lab/widgets/custom_elevated_button.dart';
import 'package:mobiile_lab/widgets/custom_text_form_field.dart';
import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';
import 'package:mobiile_lab/domain/googleauth/google_auth_helper.dart';
import 'package:mobiile_lab/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
        create: (context) =>
            SignupBloc(SignupState(signupModelObj: SignupModel()))
              ..add(SignupInitialEvent()),
        child: SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.h, vertical: 37.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_farmereats".tr,
                                      style: theme.textTheme.bodyLarge)),
                              SizedBox(height: 32.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_signup_1_of_4".tr,
                                      style: theme.textTheme.titleSmall)),
                              SizedBox(height: 2.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_welcome".tr,
                                      style: theme.textTheme.headlineLarge)),
                              SizedBox(height: 37.v),
                              _buildLoginSection(context),
                              SizedBox(height: 33.v),
                              Text("lbl_or_signup_with".tr,
                                  style: theme.textTheme.labelMedium),
                              SizedBox(height: 30.v),
                              _buildFullNameSection(context),
                              SizedBox(height: 24.v),
                              _buildEmailSection(context),
                              SizedBox(height: 24.v),
                              _buildPhoneNumberSection(context),
                              SizedBox(height: 24.v),
                              _buildPasswordSection(context),
                              SizedBox(height: 24.v),
                              _buildConfirmPasswordSection(context),
                              SizedBox(height: 69.v),
                              _buildContinueButtonSection(context),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildLoginSection(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: appTheme.black900.withOpacity(0.08), width: 1.h),
              borderRadius: BorderRadiusStyle.circleBorder26),
          child: Container(
              height: 52.v,
              width: 96.h,
              padding: EdgeInsets.symmetric(horizontal: 34.h, vertical: 12.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder26),
              child: Stack(alignment: Alignment.centerRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgGoogle,
                    height: 25.adaptSize,
                    width: 25.adaptSize,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgGoogle(context);
                    }),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgVector,
                                  height: 9.v,
                                  width: 19.h),
                              Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      height: 15.v,
                                      width: 23.h,
                                      child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgMobile,
                                                height: 9.v,
                                                width: 19.h,
                                                alignment:
                                                    Alignment.bottomLeft),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgArrowLeft,
                                                height: 11.v,
                                                width: 12.h,
                                                alignment: Alignment.topRight)
                                          ])))
                            ])))
              ]))),
      Container(
          height: 52.v,
          width: 96.h,
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 10.v),
          decoration: AppDecoration.outlineBlack900
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder26),
          child: CustomImageView(
              imagePath: ImageConstant.imgIcons8AppleLogo,
              height: 30.adaptSize,
              width: 30.adaptSize,
              alignment: Alignment.center)),
      Container(
          height: 52.v,
          width: 96.h,
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 10.v),
          decoration: AppDecoration.outlineBlack900
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder26),
          child: CustomImageView(
              imagePath: ImageConstant.imgFacebookSecondarycontainer,
              height: 30.adaptSize,
              width: 30.adaptSize,
              alignment: Alignment.center,
              onTap: () {
                onTapImgFacebook(context);
              }))
    ]);
  }

  /// Section Widget
  Widget _buildFullNameSection(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.fullNameSectionController,
        builder: (context, fullNameSectionController) {
          return CustomTextFormField(
              controller: fullNameSectionController,
              hintText: "lbl_full_name".tr,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 16.v, 10.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLock,
                      height: 15.adaptSize,
                      width: 15.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.emailSectionController,
        builder: (context, emailSectionController) {
          return CustomTextFormField(
              controller: emailSectionController,
              hintText: "lbl_email_address".tr,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 16.v, 10.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgClock,
                      height: 15.adaptSize,
                      width: 15.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPhoneNumberSection(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.phoneNumberSectionController,
        builder: (context, phoneNumberSectionController) {
          return CustomTextFormField(
              controller: phoneNumberSectionController,
              hintText: "lbl_phone_number".tr,
              textInputType: TextInputType.phone,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 16.v, 10.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCall,
                      height: 15.adaptSize,
                      width: 15.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (!isValidPhone(value)) {
                  return "err_msg_please_enter_valid_phone_number".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPasswordSection(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.passwordSectionController,
        builder: (context, passwordSectionController) {
          return CustomTextFormField(
              controller: passwordSectionController,
              hintText: "lbl_password".tr,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 14.v, 10.h, 14.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLocation,
                      height: 19.v,
                      width: 15.h)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: true);
        });
  }

  /// Section Widget
  Widget _buildConfirmPasswordSection(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.confirmPasswordSectionController,
        builder: (context, confirmPasswordSectionController) {
          return CustomTextFormField(
              controller: confirmPasswordSectionController,
              hintText: "msg_re_enter_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 14.v, 10.h, 14.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLocation,
                      height: 19.v,
                      width: 15.h)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: true);
        });
  }

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return CustomElevatedButton(width: 226.h, text: "lbl_continue".tr);
  }

  /// Section Widget
  Widget _buildContinueButtonSection(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 18.v, bottom: 12.v),
          child: Text("lbl_login".tr,
              style: CustomTextStyles.bodyMediumBlack900
                  .copyWith(decoration: TextDecoration.underline))),
      _buildContinue(context)
    ]);
  }

  onTapImgGoogle(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  onTapImgFacebook(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}
