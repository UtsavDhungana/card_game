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
            matchedCard: [],
            isCompleted: false,
          ),
        );

  static List<int> _generateRandomNumbers() {
    var random = Random();
    return List.generate(4, (_) => random.nextInt(100))
        .expand((number) => [number, number])
        .toList()
      ..shuffle();
  }

  void onCardSelect(
    int cardNo,
    bool flippingBack,
  ) async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    final state = this.state;
    if (state is! _Loaded) return;
    var selectedCard = state.selectedCard;
    var totalCard = List<int>.from(state.totalCard);
    var matchedCard = List<int>.from(state.matchedCard);
    var totalAttempt = state.totalAttempt;
    var isCompleted = state.isCompleted;
    if (flippingBack && selectedCard != null && selectedCard == cardNo) {
      selectedCard = null;
    } else {
      if (selectedCard == null) {
        selectedCard = cardNo;
      } else {
        if (selectedCard == cardNo) {
          // totalCard.removeWhere((item) => item == cardNo);
          matchedCard.add(cardNo);
        }
        selectedCard = null;
      }
    }

    if (totalCard.length ~/ 2 == matchedCard.length) {
      isCompleted = true;
    }
    totalAttempt += 1;

    emit(
      state.copyWith(
        selectedCard: selectedCard,
        totalCard: totalCard,
        matchedCard: matchedCard,
        totalAttempt: totalAttempt,
        isCompleted: isCompleted,
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
      ),
    );
  }
}
