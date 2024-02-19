import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/widgets/k_button.dart';
import '../../../../core/widgets/k_message_widget.dart';
import '../cubit/login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController _passwordController;
  final TextEditingController _emailOrMobileNoController;
  final ValueNotifier<bool> _usePin;
  final TextEditingController _pinController;
  final GlobalKey<FormState> _formKey;

  const LoginButtonWidget({
    required TextEditingController passwordController,
    required TextEditingController emailOrMobileNoController,
    required TextEditingController pinController,
    required ValueNotifier<bool> usePin,
    required GlobalKey<FormState> formKey,
    Key? key,
  })  : _emailOrMobileNoController = emailOrMobileNoController,
        _passwordController = passwordController,
        _pinController = pinController,
        _usePin = usePin,
        _formKey = formKey,
        super(key: key);

  // Future<String> getDeviceToken() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   String? token = await messaging.getToken();
  //   return token!;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.0.w,
        right: 30.0.w,
        bottom: 40.0.h,
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (loginInfo) {
              Navigator.of(context).pushReplacementNamed(
                Routes.homePageRoute,
              );
              showInfo(
                context,
                StringConstant.loginSuccessfullyText,
              );
            },
            failed: (failure) {
              return showErrorInfo(
                context,
                failure.failureMessage,
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return KButton(
            text: StringConstant.signInText,
            press: () async {
              FocusScope.of(context).unfocus();
              final validated = _formKey.currentState?.validate();
              if (validated == true) {
                BlocProvider.of<LoginCubit>(context).loginUser(
                  _emailOrMobileNoController.text,
                  _passwordController.text,
                  // await getDeviceToken(),
                  '',
                  _pinController.text,
                  _usePin.value,
                );
              }
            },
            isLoading: state.maybeMap(
              loading: (value) => true,
              orElse: () => false,
            ),
          );
        },
      ),
    );
  }
}
