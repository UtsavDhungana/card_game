import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silk_innovation_utsav/features/login/presentation/widgets/password_pin_widget.dart';

import '../../../../core/constants/configs.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/k_textfield.dart';
import '../widgets/login_button_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _pinController = TextEditingController();
  final _emailOrMobileNoController = TextEditingController();
  final ValueNotifier<bool> _usePin = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorLight,
      body: SizedBox(
        height: UiConfig.kHeight.h,
        width: UiConfig.kWidth.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: UiConfig.kHeight * 0.12,
                  bottom: 70.0.h,
                ),
                child: Center(
                  child: Text(
                    AppConfig.appName,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 14.0.w,
                  right: 14.0.w,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 45.0.h,
                ),
                width: UiConfig.kWidth.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20.r,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        StringConstant.logInText,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.0.h,
                          bottom: 40.0.h,
                          left: 80.0.w,
                          right: 80.0.w,
                        ),
                        child: Text(
                          StringConstant.signInInstructionText,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    height: 1.3.h,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30.0.w,
                          right: 30.0.w,
                          bottom: 14.0.h,
                        ),
                        child: KTextField(
                          controller: _emailOrMobileNoController,
                          hintText: StringConstant.emailMobileNoText,
                          validator: Validators.validateEmailOrPhoneNumber(),
                        ),
                      ),
                      PasswordOrPinWidget(
                        passwordController: _passwordController,
                        usePin: _usePin,
                        pinController: _pinController,
                      ),
                      SizedBox(
                        height: 53.0.h,
                      ),
                      LoginButtonWidget(
                        emailOrMobileNoController: _emailOrMobileNoController,
                        passwordController: _passwordController,
                        formKey: _formKey,
                        pinController: _pinController,
                        usePin: _usePin,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
