part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;

  const factory AuthState.success({required UserInfoModel model}) = _Success;

  const factory AuthState.error({required String errorText}) = _Error;
}
