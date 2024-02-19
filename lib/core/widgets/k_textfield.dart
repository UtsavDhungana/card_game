import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class KTextField extends StatelessWidget {
  final String? initialVal;
  final bool? enabled;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String?)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final String? Function(String?)? validator;
  final bool enableInteractiveSelection;
  final bool readOnly;
  final int? maxLength;
  final int maxLines;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final double? fontSize;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatter;

  const KTextField(
      {this.hintText,
      this.inputFormatter,
      this.controller,
      this.nextNode,
      this.textInputAction,
      this.onEditingComplete,
      this.onChanged,
      this.obscureText,
      this.keyboardType,
      this.prefix,
      this.suffix,
      this.validator,
      this.enableInteractiveSelection = true,
      this.readOnly = false,
      this.maxLength,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
      this.textCapitalization = TextCapitalization.none,
      this.horizontalPadding = 14.0,
      this.verticalPadding = 13.0,
      this.fillColor = Colors.white,
      this.fontSize = 14.0,
      this.enabled = true,
      this.initialVal,
      this.onFieldSubmitted,
      this.focusNode,
      this.onSaved,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: enabled == false ? StringConstant.canNotEditText : "",
      triggerMode: enabled == false ? TooltipTriggerMode.tap : null,
      child: TextFormField(
        onTap: onTap,
        initialValue: initialVal,
        onFieldSubmitted: (value) {
          if (onFieldSubmitted != null) {
            onFieldSubmitted!(value);
          }
          FocusScope.of(context).requestFocus(nextNode);
        },
        focusNode: focusNode,
        textCapitalization: textCapitalization,
        inputFormatters:
            inputFormatter ?? [LengthLimitingTextInputFormatter(maxLength)],
        enabled: enabled,
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        readOnly: readOnly,
        enableInteractiveSelection: enableInteractiveSelection,
        textAlign: textAlign,
        textInputAction: textInputAction ?? TextInputAction.next,
        onChanged: onChanged,
        onSaved: onSaved,
        style: Theme.of(context).textTheme.titleSmall,
        onEditingComplete:
            onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
          prefixIcon: prefix,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: suffix,
          suffixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          labelText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.greyColor,
              ),
          floatingLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: const Color(0XFF333333),
              ),
          errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.errorIconColor,
              ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.r),
            borderSide: const BorderSide(
              color: AppColors.errorIconColor,
              width: 0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.0.r,
            ),
          ),
          filled: true,
          fillColor: enabled == false ? fillColor : fillColor,
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.r),
            borderSide: const BorderSide(
              color: Color(0XFFE0E0E0),
            ),
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding!,
            horizontal: horizontalPadding!,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.r),
            borderSide: const BorderSide(
              color: AppColors.darkBlueColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0.r),
            borderSide: const BorderSide(
              color: Color(0XFFE0E0E0),
            ),
          ),
        ),
      ),
    );
  }
}
