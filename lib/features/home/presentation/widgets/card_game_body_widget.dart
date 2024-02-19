import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/card_cubit.dart';
import 'card_widget.dart';
import 'game_completed_widget.dart';

class CardGameBodyWidget extends StatelessWidget {
  CardGameBodyWidget({super.key});
  final ValueNotifier<int> clickCount = ValueNotifier(1);

  void increaseClick() {
    clickCount.value += 1;
  }

  int getClick() {
    return clickCount.value;
  }

  void setClickCount(int newCount) {
    clickCount.value = newCount;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardCubit, CardState>(
      listener: (context, state) {
        state.mapOrNull(
          loaded: (value) async {
            if (value.isCompleted == true) {
              final cardCubit = BlocProvider.of<CardCubit>(context);
              final resp = await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return WillPopScope(
                      onWillPop: () async => false,
                      child: GameCompletedDialogWidget(
                        totalAttempt: value.totalAttempt,
                      ),
                    );
                  });
              if (resp == true) {
                cardCubit.resetIsCompleted();
              }
            }
          },
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          loaded: (value) {
            log(value.toString());
            return GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 45.0.w,
                vertical: 8.0.h,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: value.totalCard.length,
              itemBuilder: (context, index) {
                return CardWidget(
                  cardNumber: value.totalCard[index],
                  isMatched: value.matchedCard.contains(
                    value.totalCard[index],
                  ),
                  totalClick: value.totalClick,
                  selectedCard: value.selectedCard,
                  increaseClickCallback: increaseClick,
                  getClickCallback: getClick,
                  setClickCount: setClickCount,
                );
              },
            );
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
