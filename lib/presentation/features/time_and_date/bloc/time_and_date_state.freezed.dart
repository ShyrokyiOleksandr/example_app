// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_and_date_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimeAndDateState {
  bool get isLoading => throw _privateConstructorUsedError;
  WebViewController? get controller => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeAndDateStateCopyWith<TimeAndDateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeAndDateStateCopyWith<$Res> {
  factory $TimeAndDateStateCopyWith(
          TimeAndDateState value, $Res Function(TimeAndDateState) then) =
      _$TimeAndDateStateCopyWithImpl<$Res, TimeAndDateState>;
  @useResult
  $Res call({bool isLoading, WebViewController? controller});
}

/// @nodoc
class _$TimeAndDateStateCopyWithImpl<$Res, $Val extends TimeAndDateState>
    implements $TimeAndDateStateCopyWith<$Res> {
  _$TimeAndDateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? controller = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as WebViewController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeAndDateStateCopyWith<$Res>
    implements $TimeAndDateStateCopyWith<$Res> {
  factory _$$_TimeAndDateStateCopyWith(
          _$_TimeAndDateState value, $Res Function(_$_TimeAndDateState) then) =
      __$$_TimeAndDateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, WebViewController? controller});
}

/// @nodoc
class __$$_TimeAndDateStateCopyWithImpl<$Res>
    extends _$TimeAndDateStateCopyWithImpl<$Res, _$_TimeAndDateState>
    implements _$$_TimeAndDateStateCopyWith<$Res> {
  __$$_TimeAndDateStateCopyWithImpl(
      _$_TimeAndDateState _value, $Res Function(_$_TimeAndDateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? controller = freezed,
  }) {
    return _then(_$_TimeAndDateState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as WebViewController?,
    ));
  }
}

/// @nodoc

class _$_TimeAndDateState implements _TimeAndDateState {
  const _$_TimeAndDateState(
      {required this.isLoading, required this.controller});

  @override
  final bool isLoading;
  @override
  final WebViewController? controller;

  @override
  String toString() {
    return 'TimeAndDateState(isLoading: $isLoading, controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeAndDateState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeAndDateStateCopyWith<_$_TimeAndDateState> get copyWith =>
      __$$_TimeAndDateStateCopyWithImpl<_$_TimeAndDateState>(this, _$identity);
}

abstract class _TimeAndDateState implements TimeAndDateState {
  const factory _TimeAndDateState(
      {required final bool isLoading,
      required final WebViewController? controller}) = _$_TimeAndDateState;

  @override
  bool get isLoading;
  @override
  WebViewController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$_TimeAndDateStateCopyWith<_$_TimeAndDateState> get copyWith =>
      throw _privateConstructorUsedError;
}
