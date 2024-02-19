// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<int> totalCard,
            int? selectedCard,
            int totalAttempt,
            int totalClick,
            List<int> matchedCard,
            bool isCompleted)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<int> totalCard, int? selectedCard, int totalAttempt,
            int totalClick, List<int> matchedCard, bool isCompleted)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<int> totalCard, int? selectedCard, int totalAttempt,
            int totalClick, List<int> matchedCard, bool isCompleted)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res, CardState>;
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res, $Val extends CardState>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CardState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<int> totalCard,
            int? selectedCard,
            int totalAttempt,
            int totalClick,
            List<int> matchedCard,
            bool isCompleted)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<int> totalCard, int? selectedCard, int totalAttempt,
            int totalClick, List<int> matchedCard, bool isCompleted)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<int> totalCard, int? selectedCard, int totalAttempt,
            int totalClick, List<int> matchedCard, bool isCompleted)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CardState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'CardState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<int> totalCard,
            int? selectedCard,
            int totalAttempt,
            int totalClick,
            List<int> matchedCard,
            bool isCompleted)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<int> totalCard, int? selectedCard, int totalAttempt,
            int totalClick, List<int> matchedCard, bool isCompleted)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<int> totalCard, int? selectedCard, int totalAttempt,
            int totalClick, List<int> matchedCard, bool isCompleted)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CardState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<int> totalCard,
      int? selectedCard,
      int totalAttempt,
      int totalClick,
      List<int> matchedCard,
      bool isCompleted});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCard = null,
    Object? selectedCard = freezed,
    Object? totalAttempt = null,
    Object? totalClick = null,
    Object? matchedCard = null,
    Object? isCompleted = null,
  }) {
    return _then(_$_Loaded(
      totalCard: null == totalCard
          ? _value._totalCard
          : totalCard // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedCard: freezed == selectedCard
          ? _value.selectedCard
          : selectedCard // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAttempt: null == totalAttempt
          ? _value.totalAttempt
          : totalAttempt // ignore: cast_nullable_to_non_nullable
              as int,
      totalClick: null == totalClick
          ? _value.totalClick
          : totalClick // ignore: cast_nullable_to_non_nullable
              as int,
      matchedCard: null == matchedCard
          ? _value._matchedCard
          : matchedCard // ignore: cast_nullable_to_non_nullable
              as List<int>,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required final List<int> totalCard,
      required this.selectedCard,
      required this.totalAttempt,
      required this.totalClick,
      required final List<int> matchedCard,
      required this.isCompleted})
      : _totalCard = totalCard,
        _matchedCard = matchedCard;

  final List<int> _totalCard;
  @override
  List<int> get totalCard {
    if (_totalCard is EqualUnmodifiableListView) return _totalCard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalCard);
  }

  @override
  final int? selectedCard;
  @override
  final int totalAttempt;
  @override
  final int totalClick;
  final List<int> _matchedCard;
  @override
  List<int> get matchedCard {
    if (_matchedCard is EqualUnmodifiableListView) return _matchedCard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchedCard);
  }

  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'CardState.loaded(totalCard: $totalCard, selectedCard: $selectedCard, totalAttempt: $totalAttempt, totalClick: $totalClick, matchedCard: $matchedCard, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality()
                .equals(other._totalCard, _totalCard) &&
            (identical(other.selectedCard, selectedCard) ||
                other.selectedCard == selectedCard) &&
            (identical(other.totalAttempt, totalAttempt) ||
                other.totalAttempt == totalAttempt) &&
            (identical(other.totalClick, totalClick) ||
                other.totalClick == totalClick) &&
            const DeepCollectionEquality()
                .equals(other._matchedCard, _matchedCard) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_totalCard),
      selectedCard,
      totalAttempt,
      totalClick,
      const DeepCollectionEquality().hash(_matchedCard),
      isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<int> totalCard,
            int? selectedCard,
            int totalAttempt,
            int totalClick,
            List<int> matchedCard,
            bool isCompleted)
        loaded,
  }) {
    return loaded(totalCard, selectedCard, totalAttempt, totalClick,
        matchedCard, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<int> totalCard, int? selectedCard, int totalAttempt,
            int totalClick, List<int> matchedCard, bool isCompleted)?
        loaded,
  }) {
    return loaded?.call(totalCard, selectedCard, totalAttempt, totalClick,
        matchedCard, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<int> totalCard, int? selectedCard, int totalAttempt,
            int totalClick, List<int> matchedCard, bool isCompleted)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(totalCard, selectedCard, totalAttempt, totalClick,
          matchedCard, isCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CardState {
  const factory _Loaded(
      {required final List<int> totalCard,
      required final int? selectedCard,
      required final int totalAttempt,
      required final int totalClick,
      required final List<int> matchedCard,
      required final bool isCompleted}) = _$_Loaded;

  List<int> get totalCard;
  int? get selectedCard;
  int get totalAttempt;
  int get totalClick;
  List<int> get matchedCard;
  bool get isCompleted;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}
