import 'package:flutter/material.dart';

import '../constants/constants.dart';

void showErrorInfo(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(_getErrorWidget(errorMessage));
}

void showInfo(
  BuildContext context,
  String message, [
  Color? color,
]) {
  ScaffoldMessenger.of(context).showSnackBar(
    _getMessageWidget(
      message,
      color,
    ),
  );
}

SnackBar _getErrorWidget(String errorMessage) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(
      errorMessage,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: AppColors.errorIconColor,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () => {},
      disabledTextColor: Colors.white,
      textColor: Colors.white,
    ),
  );
}

SnackBar _getMessageWidget(
  String message, [
  Color? color,
]) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: color ?? Colors.green,
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () => {},
      disabledTextColor: Colors.white,
      textColor: Colors.white,
    ),
  );
}
