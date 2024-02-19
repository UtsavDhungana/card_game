import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/k_password_widget.dart';

class PasswordOrPinWidget extends StatelessWidget {
  final TextEditingController _passwordController;
  final TextEditingController _pinController;
  final ValueNotifier<bool> _usePin;
  const PasswordOrPinWidget({
    super.key,
    required TextEditingController passwordController,
    required TextEditingController pinController,
    required ValueNotifier<bool> usePin,
  })  : _passwordController = passwordController,
        _pinController = pinController,
        _usePin = usePin;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _usePin,
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            if (!value)
              PasswordWidget(
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  // _performLogin();
                },
              ),
            if (value)
              Padding(
                padding: EdgeInsets.only(
                  left: 30.0.w,
                  right: 30.0.w,
                  bottom: 14.0.h,
                ),
                child: Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  validator: (s) {
                    return s != null && s.isNotEmpty && s.length == 4
                        ? null
                        : ErrorMessage.pinEmptyErrorText;
                  },
                  errorTextStyle:
                      Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.errorIconColor,
                          ),
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  controller: _pinController,
                ),
              ),
            InkWell(
              onTap: () {
                _usePin.value = !_usePin.value;
              },
              child: Text(
                value
                    ? StringConstant.usePasswordText
                    : StringConstant.usePinText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color(0XFF8F959E),
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
