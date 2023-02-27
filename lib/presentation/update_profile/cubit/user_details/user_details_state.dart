part of 'user_details_cubit.dart';

enum UserProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class UserDetailsState extends Equatable {
  final UserProfileStatus status;
  final UserDetails userDetails;
  final CustomError error;
  UserDetailsState({
    required this.status,
    required this.userDetails,
    required this.error,
  });

  factory UserDetailsState.initial() {
    return UserDetailsState(
        status: UserProfileStatus.initial,
        userDetails: UserDetails(
            data: Data(
                name: 'Enter your name',
                email: "Enter your Email",
                number: "Enter your Number",
                address: "Enter your Address",
                hitRemaining: 'loading..')),
        error: CustomError());
  }
  @override
  List<Object> get props => [status, userDetails, error];

  UserDetailsState copyWith({
    UserProfileStatus? status,
    UserDetails? userDetails,
    CustomError? error,
  }) {
    return UserDetailsState(
      status: status ?? this.status,
      userDetails: userDetails ?? this.userDetails,
      error: error ?? this.error,
    );
  }
}
