import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/configs.dart';
import 'core/constants/constants.dart';
import 'core/constants/routes.dart';
import 'features/login/presentation/cubit/login_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    final isLoggedIn = await loginCubit.isLoggedIn();
    if (!mounted) return;
    if (isLoggedIn) {
      await loginCubit.setStateToLoaded();
      _navigateToNextScreen(() {
        Navigator.of(context).pushReplacementNamed(
          Routes.homePageRoute,
        );
      });
    } else {
      _navigateToNextScreen(
        () {
          Navigator.of(context).pushReplacementNamed(
            Routes.loginPageRoute,
          );
        },
      );
    }
  }

  void _navigateToNextScreen(VoidCallback onSuccess) async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
    );
    onSuccess.call();
  }

  @override
  Widget build(BuildContext context) {
    final appName = AppConfig.appName.split(' ');
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: RichText(
            text: TextSpan(
              text: appName.first,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: appName.last,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
