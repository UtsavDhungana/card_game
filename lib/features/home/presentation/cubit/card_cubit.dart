import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'card_state.dart';
part 'card_cubit.freezed.dart';

@injectable
class CardCubit extends Cubit<CardState> {
  CardCubit()
      : super(
          CardState.loaded(
            totalCard: _generateRandomNumbers(),
            selectedCard: null,
            totalAttempt: 0,
            totalClick: 0,
            matchedCard: [],
            isCompleted: false,
          ),
        );

  static List<int> _generateRandomNumbers() {
    var random = Random();
    return List.generate(3, (_) => random.nextInt(100))
        .expand((number) => [number, number])
        .toList()
      ..shuffle();
  }

  void onCardSelect(
    int cardNo,
    bool flippingBack,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final state = this.state;
    if (state is! _Loaded) return;
    // emit(
    //   const _Loading(),
    // );

    var selectedCard = state.selectedCard;
    var totalCard = List<int>.from(state.totalCard);
    var matchedCard = List<int>.from(state.matchedCard);
    var totalAttempt = state.totalAttempt;
    var totalClick = state.totalClick;
    var isCompleted = state.isCompleted;
    if (totalClick == 2) {
      totalClick = 0;
    }

    if (flippingBack && selectedCard != null && selectedCard == cardNo) {
      print("000000");
      selectedCard = null;
      totalAttempt += 1;
    } else {
      print("111111");
      if (selectedCard == null) {
        selectedCard = cardNo;
      } else {
        if (selectedCard == cardNo) {
          matchedCard.add(cardNo);
        }
        selectedCard = null;
        totalAttempt += 1;
      }
    }

    isCompleted = totalCard.length ~/ 2 == matchedCard.length;
    totalClick += 1;
    emit(
      state.copyWith(
        selectedCard: selectedCard,
        totalCard: totalCard,
        matchedCard: matchedCard,
        totalAttempt: totalAttempt,
        isCompleted: isCompleted,
        totalClick: totalClick,
      ),
    );
  }

  void resetIsCompleted() {
    final state = this.state;
    if (state is! _Loaded) return;
    emit(
      state.copyWith(
        totalCard: _generateRandomNumbers(),
        selectedCard: null,
        matchedCard: [],
        totalAttempt: 0,
        isCompleted: false,
        totalClick: 0,
      ),
    );
  }
}
