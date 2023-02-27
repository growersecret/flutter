part of 'update_profile_cubit.dart';

enum UpdateProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class UpdateProfileState extends Equatable {
  final UpdateProfileStatus status;
  final UserDetails userDetails;
  final CustomError error;
  UpdateProfileState({
    required this.status,
    required this.userDetails,
    required this.error,
  });

  factory UpdateProfileState.initial() {
    return UpdateProfileState(
        status: UpdateProfileStatus.initial,
        userDetails: UserDetails(
            data: Data(
                name: 'Name',
                email: "Email",
                number: "Number",
                address: "Address",
                hitRemaining: 'loading..')),
        error: CustomError());
  }
  UpdateProfileState copyWith({
    UpdateProfileStatus? status,
    UserDetails? userDetails,
    CustomError? error,
  }) {
    return UpdateProfileState(
      status: status ?? this.status,
      userDetails: userDetails ?? this.userDetails,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, userDetails, error];
}
