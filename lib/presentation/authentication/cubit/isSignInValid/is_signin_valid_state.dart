// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'is_signin_valid_cubit.dart';

class IsSigninValidState extends Equatable {
  final bool isSignInValid;
  IsSigninValidState({
    required this.isSignInValid,
  });

  factory IsSigninValidState.initial() {
    return IsSigninValidState(isSignInValid: false);
  }
  @override
  List<Object> get props => [isSignInValid];

  IsSigninValidState copyWith({
    bool? isSignInValid,
  }) {
    return IsSigninValidState(
      isSignInValid: isSignInValid ?? this.isSignInValid,
    );
  }
}
