import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/data/models/user_info_model.dart';
import 'package:test_project/data/repositories/authorization_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.repository,
  }) : super(const _Initial()) {
    on<_Auth>(
      (event, emit) async {
        emit(
          const _Loading(),
        );
        try {
          final model = await repository.authorization(
            email: event.email,
            password: event.password,
          );
          _Success(
            model: model,
          );
        } catch (e) {
          emit(
            _Error(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }
  final AuthorizationRepository repository;
}
