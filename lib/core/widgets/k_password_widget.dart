
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import '../utils/validators.dart';
import 'k_textfield.dart';

class PasswordWidget extends StatefulWidget {
  final bool validate;
  final TextInputAction? textInputAction;
  final Function(String?)? onFieldSubmitted;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextEditingController? forConfirmPasswordSoPasswordController;
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final String? alternativeText;

  const PasswordWidget(
      {this.onFieldSubmitted,
      this.textInputAction,
      this.alternativeText,
      this.focusNode,
      this.nextNode,
      this.forConfirmPasswordSoPasswordController,
      this.controller,
      this.padding,
      this.validate = true,
      Key? key})
      : super(key: key);

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    final forConfirmPassword =
        widget.forConfirmPasswordSoPasswordController != null;
    return Padding(
      padding: widget.padding ??
          EdgeInsets.only(
            left: 32.0.w,
            right: 32.0.w,
            bottom: 20.0.h,
          ),
      child: KTextField(
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        nextNode: widget.nextNode,
        controller: forConfirmPassword
            ? widget.forConfirmPasswordSoPasswordController
            : widget.controller,
        obscureText: !visible,
        suffix: Padding(
          padding: EdgeInsets.only(
            right: 13.75.w,
          ),
          child: InkWell(
            onTap: () => setState(() {
              visible = !visible;
            }),
            child: Icon(
              visible ? Icons.visibility : Icons.visibility_off,
              size: 20.0.sp,
            ),
          ),
        ),
        hintText: _getAlternativeText(forConfirmPassword),
        validator: widget.validate == true
            ? forConfirmPassword
                ? Validators.getConfirmPasswordValidator(
                    widget.forConfirmPasswordSoPasswordController,
                  )
                : Validators.getPasswordValidator()
            : null,
      ),
    );
  }

  String _getAlternativeText(bool forConfirmPassword) {
    if (widget.alternativeText != null) {
      return widget.alternativeText ?? "";
    } else if (forConfirmPassword) {
      return StringConstant.confirmPasswordText;
    } else {
      return StringConstant.passwordText;
    }
  }
}
