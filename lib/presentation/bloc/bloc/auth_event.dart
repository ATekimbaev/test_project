part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.auth({
    required String email,
    required String password,
  }) = _Auth;
}
