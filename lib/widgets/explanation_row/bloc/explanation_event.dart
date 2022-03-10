part of 'explanation_bloc.dart';

abstract class ExplanationEvent extends Equatable {
  const ExplanationEvent();

  @override
  List<Object> get props => [];
}

class AnimationPlayed extends ExplanationEvent {
  final String animation;

  const AnimationPlayed({required this.animation});

  @override
  List<Object> get props => [animation];

  @override
  String toString() => 'AnimationPlayed { animation: $animation }';
}
