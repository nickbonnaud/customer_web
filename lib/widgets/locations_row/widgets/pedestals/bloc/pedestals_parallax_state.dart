part of 'pedestals_parallax_bloc.dart';

@immutable
class PedestalsParallaxState extends Equatable {
  final double maxPosition = 600;

  final bool isImageVisible;
  final double? currentPosition;
  final double? entryPosition;

  double get parallaxOffset => (currentPosition! - entryPosition!) * .1;

  const PedestalsParallaxState({
    required this.isImageVisible,
    this.currentPosition,
    this.entryPosition
  });

  factory PedestalsParallaxState.initial() {
    return const PedestalsParallaxState(isImageVisible: false);
  }

  PedestalsParallaxState update({
    bool? isImageVisible,
    double? currentPosition,
    double? entryPosition,
    bool resetEntry = false
  }) {
    return PedestalsParallaxState(
      isImageVisible: isImageVisible ?? this.isImageVisible,
      currentPosition: currentPosition ?? this.currentPosition,
      entryPosition: resetEntry ? null : entryPosition ?? this.entryPosition
    );
  }
  
  @override
  List<Object?> get props => [
    isImageVisible,
    currentPosition,
    entryPosition
  ];

  @override
  String toString() => '''PedestalsParallaxState {
    isImageVisible: $isImageVisible
    currentPosition: $currentPosition
    entryPosition: $entryPosition
  }''';
}
