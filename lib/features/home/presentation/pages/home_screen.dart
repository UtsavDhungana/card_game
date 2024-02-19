import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silk_innovation_utsav/features/home/presentation/cubit/card_cubit.dart';
import 'package:silk_innovation_utsav/features/home/presentation/widgets/card_widget.dart';
import 'package:silk_innovation_utsav/features/home/presentation/widgets/game_completed_widget.dart';
import 'package:silk_innovation_utsav/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/widgets/logout_dialog_widget.dart';
import '../../../../injection.dart';

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
    return Scaffold(
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
      body: BlocConsumer<CardCubit, CardState>(
        listener: (context, state) {
          log("Listener");
          state.mapOrNull(
            loaded: (value) async {
              if (value.isCompleted == true) {
                final cardCubit = BlocProvider.of<CardCubit>(context);
                final value = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const GameCompletedDialogWidget();
                    });
                if (value == true) {
                  cardCubit.resetIsCompleted();
                }
              }
              // if (value.selectedCard == null &&
              //     _controller.isCompleted &&
              //     value.matchedCard.contains(widget.cardNumber) == false) {
              //   _controller.reverse();
              // }
            },
          );
        },
        builder: (context, state) {
          log("Builder");
          return state.maybeMap(
            loaded: (value) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                  vertical: 8.0.h,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: value.totalCard.length,
                itemBuilder: (context, index) {
                  return CardWidget(
                    cardNumber: value.totalCard[index],
                    isMatched: value.matchedCard.contains(
                      value.totalCard[index],
                    ),
                  );
                },
              );
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
