// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardState {
  String get uid => throw _privateConstructorUsedError;
  DateTime get updatedOn => throw _privateConstructorUsedError;
  IList<CardEntityView> get cardViews => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardStateCopyWith<CardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardStateCopyWith<$Res> {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) then) =
      _$CardStateCopyWithImpl<$Res, CardState>;
  @useResult
  $Res call({String uid, DateTime updatedOn, IList<CardEntityView> cardViews});
}

/// @nodoc
class _$CardStateCopyWithImpl<$Res, $Val extends CardState>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? updatedOn = null,
    Object? cardViews = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedOn: null == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cardViews: null == cardViews
          ? _value.cardViews
          : cardViews // ignore: cast_nullable_to_non_nullable
              as IList<CardEntityView>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardStateCopyWith<$Res> implements $CardStateCopyWith<$Res> {
  factory _$$_CardStateCopyWith(
          _$_CardState value, $Res Function(_$_CardState) then) =
      __$$_CardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, DateTime updatedOn, IList<CardEntityView> cardViews});
}

/// @nodoc
class __$$_CardStateCopyWithImpl<$Res>
    extends _$CardStateCopyWithImpl<$Res, _$_CardState>
    implements _$$_CardStateCopyWith<$Res> {
  __$$_CardStateCopyWithImpl(
      _$_CardState _value, $Res Function(_$_CardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? updatedOn = null,
    Object? cardViews = null,
  }) {
    return _then(_$_CardState(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedOn: null == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cardViews: null == cardViews
          ? _value.cardViews
          : cardViews // ignore: cast_nullable_to_non_nullable
              as IList<CardEntityView>,
    ));
  }
}

/// @nodoc

class _$_CardState extends _CardState {
  const _$_CardState(
      {required this.uid, required this.updatedOn, required this.cardViews})
      : super._();

  @override
  final String uid;
  @override
  final DateTime updatedOn;
  @override
  final IList<CardEntityView> cardViews;

  @override
  String toString() {
    return 'CardState(uid: $uid, updatedOn: $updatedOn, cardViews: $cardViews)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardState &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn) &&
            const DeepCollectionEquality().equals(other.cardViews, cardViews));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, updatedOn,
      const DeepCollectionEquality().hash(cardViews));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardStateCopyWith<_$_CardState> get copyWith =>
      __$$_CardStateCopyWithImpl<_$_CardState>(this, _$identity);
}

abstract class _CardState extends CardState {
  const factory _CardState(
      {required final String uid,
      required final DateTime updatedOn,
      required final IList<CardEntityView> cardViews}) = _$_CardState;
  const _CardState._() : super._();

  @override
  String get uid;
  @override
  DateTime get updatedOn;
  @override
  IList<CardEntityView> get cardViews;
  @override
  @JsonKey(ignore: true)
  _$$_CardStateCopyWith<_$_CardState> get copyWith =>
      throw _privateConstructorUsedError;
}
