import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silk_innovation_utsav/features/home/presentation/cubit/card_cubit.dart';
import 'package:silk_innovation_utsav/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/widgets/logout_dialog_widget.dart';
import '../../../../injection.dart';
import '../widgets/card_game_body_widget.dart';
import '../widgets/user_info_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CardCubit>(),
      child: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            StringConstant.homeText,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                final navigator = Navigator.of(context);
                final loginCubit = BlocProvider.of<LoginCubit>(context);
                final value = await showDialog(
                    context: context,
                    builder: (context) {
                      return const LogoutDialogWidget();
                    });
                if (value == true) {
                  loginCubit.logOut();
                  navigator.pushReplacementNamed(
                    Routes.loginPageRoute,
                  );
                }
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const UserInfoWidget(),
              SizedBox(
                height: 12.0.h,
              ),
              CardGameBodyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
