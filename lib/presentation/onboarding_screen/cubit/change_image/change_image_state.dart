part of 'change_image_cubit.dart';

class ChangeImageState extends Equatable {
  final bool switchImage;
  ChangeImageState({
    required this.switchImage,
  });

  factory ChangeImageState.initial() {
    return ChangeImageState(switchImage: false);
  }
  ChangeImageState copyWith({
    bool? switchImage,
  }) {
    return ChangeImageState(
      switchImage: switchImage ?? this.switchImage,
    );
  }

  @override
  List<Object> get props => [switchImage];
}
