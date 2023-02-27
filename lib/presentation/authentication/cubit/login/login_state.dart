part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  loaded,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final CustomError error;
  LoginState({
    required this.status,
    required this.error,
  });

  factory LoginState.initial() {
    return LoginState(status: LoginStatus.initial, error: CustomError());
  }

  @override
  List<Object> get props => [status, error];

  LoginState copyWith({
    LoginStatus? status,
    CustomError? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
