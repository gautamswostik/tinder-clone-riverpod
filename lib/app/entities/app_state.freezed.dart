// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  AppStarted<T> started<T>() {
    return AppStarted<T>();
  }

  AppAuthenticated<T> authenticated<T>(T value) {
    return AppAuthenticated<T>(
      value,
    );
  }

  AppUnauthenticated<T> unauthenticated<T>({T? failure}) {
    return AppUnauthenticated<T>(
      failure: failure,
    );
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T value) authenticated,
    required TResult Function(T? failure) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T value)? authenticated,
    TResult Function(T? failure)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T value)? authenticated,
    TResult Function(T? failure)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(AppAuthenticated<T> value) authenticated,
    required TResult Function(AppUnauthenticated<T> value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(AppAuthenticated<T> value)? authenticated,
    TResult Function(AppUnauthenticated<T> value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(AppAuthenticated<T> value)? authenticated,
    TResult Function(AppUnauthenticated<T> value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<T, $Res> {
  factory $AppStateCopyWith(
          AppState<T> value, $Res Function(AppState<T>) then) =
      _$AppStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$AppStateCopyWithImpl<T, $Res> implements $AppStateCopyWith<T, $Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState<T> _value;
  // ignore: unused_field
  final $Res Function(AppState<T>) _then;
}

/// @nodoc
abstract class $AppStartedCopyWith<T, $Res> {
  factory $AppStartedCopyWith(
          AppStarted<T> value, $Res Function(AppStarted<T>) then) =
      _$AppStartedCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$AppStartedCopyWithImpl<T, $Res> extends _$AppStateCopyWithImpl<T, $Res>
    implements $AppStartedCopyWith<T, $Res> {
  _$AppStartedCopyWithImpl(
      AppStarted<T> _value, $Res Function(AppStarted<T>) _then)
      : super(_value, (v) => _then(v as AppStarted<T>));

  @override
  AppStarted<T> get _value => super._value as AppStarted<T>;
}

/// @nodoc

class _$AppStarted<T> implements AppStarted<T> {
  const _$AppStarted();

  @override
  String toString() {
    return 'AppState<$T>.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppStarted<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T value) authenticated,
    required TResult Function(T? failure) unauthenticated,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T value)? authenticated,
    TResult Function(T? failure)? unauthenticated,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T value)? authenticated,
    TResult Function(T? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(AppAuthenticated<T> value) authenticated,
    required TResult Function(AppUnauthenticated<T> value) unauthenticated,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(AppAuthenticated<T> value)? authenticated,
    TResult Function(AppUnauthenticated<T> value)? unauthenticated,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(AppAuthenticated<T> value)? authenticated,
    TResult Function(AppUnauthenticated<T> value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class AppStarted<T> implements AppState<T> {
  const factory AppStarted() = _$AppStarted<T>;
}

/// @nodoc
abstract class $AppAuthenticatedCopyWith<T, $Res> {
  factory $AppAuthenticatedCopyWith(
          AppAuthenticated<T> value, $Res Function(AppAuthenticated<T>) then) =
      _$AppAuthenticatedCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class _$AppAuthenticatedCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res>
    implements $AppAuthenticatedCopyWith<T, $Res> {
  _$AppAuthenticatedCopyWithImpl(
      AppAuthenticated<T> _value, $Res Function(AppAuthenticated<T>) _then)
      : super(_value, (v) => _then(v as AppAuthenticated<T>));

  @override
  AppAuthenticated<T> get _value => super._value as AppAuthenticated<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(AppAuthenticated<T>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AppAuthenticated<T> implements AppAuthenticated<T> {
  const _$AppAuthenticated(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'AppState<$T>.authenticated(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppAuthenticated<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $AppAuthenticatedCopyWith<T, AppAuthenticated<T>> get copyWith =>
      _$AppAuthenticatedCopyWithImpl<T, AppAuthenticated<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T value) authenticated,
    required TResult Function(T? failure) unauthenticated,
  }) {
    return authenticated(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T value)? authenticated,
    TResult Function(T? failure)? unauthenticated,
  }) {
    return authenticated?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T value)? authenticated,
    TResult Function(T? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(AppAuthenticated<T> value) authenticated,
    required TResult Function(AppUnauthenticated<T> value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(AppAuthenticated<T> value)? authenticated,
    TResult Function(AppUnauthenticated<T> value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(AppAuthenticated<T> value)? authenticated,
    TResult Function(AppUnauthenticated<T> value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AppAuthenticated<T> implements AppState<T> {
  const factory AppAuthenticated(T value) = _$AppAuthenticated<T>;

  T get value;
  @JsonKey(ignore: true)
  $AppAuthenticatedCopyWith<T, AppAuthenticated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUnauthenticatedCopyWith<T, $Res> {
  factory $AppUnauthenticatedCopyWith(AppUnauthenticated<T> value,
          $Res Function(AppUnauthenticated<T>) then) =
      _$AppUnauthenticatedCopyWithImpl<T, $Res>;
  $Res call({T? failure});
}

/// @nodoc
class _$AppUnauthenticatedCopyWithImpl<T, $Res>
    extends _$AppStateCopyWithImpl<T, $Res>
    implements $AppUnauthenticatedCopyWith<T, $Res> {
  _$AppUnauthenticatedCopyWithImpl(
      AppUnauthenticated<T> _value, $Res Function(AppUnauthenticated<T>) _then)
      : super(_value, (v) => _then(v as AppUnauthenticated<T>));

  @override
  AppUnauthenticated<T> get _value => super._value as AppUnauthenticated<T>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(AppUnauthenticated<T>(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$AppUnauthenticated<T> implements AppUnauthenticated<T> {
  const _$AppUnauthenticated({this.failure});

  @override
  final T? failure;

  @override
  String toString() {
    return 'AppState<$T>.unauthenticated(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppUnauthenticated<T> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $AppUnauthenticatedCopyWith<T, AppUnauthenticated<T>> get copyWith =>
      _$AppUnauthenticatedCopyWithImpl<T, AppUnauthenticated<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(T value) authenticated,
    required TResult Function(T? failure) unauthenticated,
  }) {
    return unauthenticated(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T value)? authenticated,
    TResult Function(T? failure)? unauthenticated,
  }) {
    return unauthenticated?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(T value)? authenticated,
    TResult Function(T? failure)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStarted<T> value) started,
    required TResult Function(AppAuthenticated<T> value) authenticated,
    required TResult Function(AppUnauthenticated<T> value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(AppAuthenticated<T> value)? authenticated,
    TResult Function(AppUnauthenticated<T> value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStarted<T> value)? started,
    TResult Function(AppAuthenticated<T> value)? authenticated,
    TResult Function(AppUnauthenticated<T> value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AppUnauthenticated<T> implements AppState<T> {
  const factory AppUnauthenticated({T? failure}) = _$AppUnauthenticated<T>;

  T? get failure;
  @JsonKey(ignore: true)
  $AppUnauthenticatedCopyWith<T, AppUnauthenticated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
