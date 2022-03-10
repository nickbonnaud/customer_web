part of 'pedestals_parallax_bloc.dart';

abstract class PedestalsParallaxEvent extends Equatable {
  const PedestalsParallaxEvent();

  @override
  List<Object?> get props => [];
}

class ImageVisibilityChanged extends PedestalsParallaxEvent {
  final bool isImageVisible;
  final double? entryPosition;
  final double? currentPosition;

  const ImageVisibilityChanged({required this.isImageVisible, required this.entryPosition, this.currentPosition});

  @override
  List<Object?> get props => [isImageVisible, entryPosition, currentPosition];

  @override
  String toString() => 'ImageVisibilityChanged { isImageVisible: $isImageVisible, entryPosition: $entryPosition, currentPosition: $currentPosition }';
}

class CurrentPositionChanged extends PedestalsParallaxEvent {
  final double currentPosition;

  const CurrentPositionChanged({required this.currentPosition});

  @override
  List<Object> get props => [currentPosition];

  @override
  String toString() => 'CurrentPositionChanged { currentPosition: $currentPosition }';
}