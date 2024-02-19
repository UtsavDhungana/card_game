part of 'card_cubit.dart';

@freezed
class CardState with _$CardState {
  const factory CardState.initial() = _Initial;
  const factory CardState.loading() = _Loading;
  const factory CardState.loaded({
    required final List<int> totalCard,
    required final int? selectedCard,
    required final int totalAttempt,
    required final int totalClick,
    required final List<int> matchedCard,
    required final bool isCompleted,
  }) = _Loaded;
}
