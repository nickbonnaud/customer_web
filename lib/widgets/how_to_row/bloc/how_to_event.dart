part of 'how_to_bloc.dart';

abstract class HowToEvent extends Equatable {
  const HowToEvent();

  @override
  List<Object> get props => [];
}

class IndexChanged extends HowToEvent {}

class SectionVisibilityChanged extends HowToEvent {}
