import 'package:flutter/material.dart';

class ApiEndpoints {
  static const loginUrl = "/login";
}

class AppColors {
  static const primaryColor = Color(0XFF2E5984);
  static const primaryColorLight = Color(0XFF73A5C6);
  static const errorIconColor = Color(0xffF43400);
  static const blueshGreyColor = Color(0XFF8F959E);
  static const greyColor = Color(0XFF828282);
  static const lightGreyColor = Color(0XFFE0E0E0);
  static const darkBlueColor = Color(0XFF002B71);
  static const appbarBackgroundColor = Color(0XFF528AAE);
}

class ErrorMessage {
  static const serverFailureMessage = "Server failure";
  static const cacheFailureMessage = "Cache failure";
  static const internetFailureMessage = "No internet connection";
  static const somethingWentWrongFailureMessage = 'Something went wrong!!';
  static const emailOrUserNameEmptyErrorText = "Email or Mobile No is required";
  static const passwordEmptyErrorText = "Password is required";
  static const pinEmptyErrorText = "Pin is required";

  static const confirmPasswordEmptyErrorText =
      "Confirmation password is required";

  static const confirmPasswordNotMatchErrorText =
      'Confirm password did not match';
}

class StringConstant {
  static const canNotEditText = "Can Not Edit";

  //HOME SCREEN
  static const transferredText = "Transferred";
  static const generatedText = "Generated";
  static const purchasedText = "Purchased";
  static const moreText = "More";
  static const homeText = "Home";

  //LOGIN SCREEN
  static const logInText = "Log in";
  static const signInInstructionText =
      "Enter your details to get sign in to your account";
  static const emailMobileNoText = "Email / Mobile No.";
  static const passwordText = "Password";
  static const signInText = "Sign in";
  static const confirmPasswordText = "Confirm Password";
  static const loginSuccessfullyText = "Logged in successfully";
  static const usePinText = "Use PIN";
  static const usePasswordText = "Use Password";

  //LOGOUT DIALOG
  static const logoutText = "Logout";
  static const logoutConfirmationText = 'Are you sure you want to logout?';
  static const yesText = 'YES';
  static const noText = 'NO';

  //GAME COMPLETED DIALOG
  static const completedText = "Completed";
  static const gameCompletedText = 'You have successfully completed the game.';
}
