import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class KButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color textColor;
  final Color? color;
  final double? height;
  final double? width;
  final double? radius;
  final Color borderColor;
  final TextAlign? txtAlignment;
  final double? fontSize;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final double? textVerticalPadding;
  final double? textVerticalHorizontal;
  final Icon? icon;
  final bool? isLoading;

  const KButton({
    Key? key,
    required this.text,
    required this.press,
    this.radius = 5.0,
    this.height,
    this.width,
    this.color,
    this.textColor = Colors.white,
    this.borderColor = Colors.black,
    this.txtAlignment,
    this.fontSize,
    this.focusNode,
    this.textStyle,
    this.textVerticalPadding,
    this.textVerticalHorizontal,
    this.icon,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      focusNode: focusNode,
      style: ElevatedButton.styleFrom(
        textStyle: null,
        elevation: 2,
        shadowColor: Colors.black,
        padding: EdgeInsets.symmetric(
          vertical: textVerticalPadding ?? 13.0.h,
          horizontal: textVerticalHorizontal ?? 50.0.w,
        ),
        backgroundColor: color ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius!.r,
          ),
        ),
        // minimumSize: const Size(
        //   double.infinity,
        //   0,
        // ),
      ),
      onPressed: isLoading == true ? () {} : press,
      child: isLoading!
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
              ),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: color ?? const Color(0XFF002B71),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : icon ??
              Text(
                text,
                textAlign: txtAlignment ?? TextAlign.center,
                style: textStyle ??
                    Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: textColor,
                        ),
              ),
    );
  }
}
