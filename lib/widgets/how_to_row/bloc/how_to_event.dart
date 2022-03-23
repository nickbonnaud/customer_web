part of 'how_to_bloc.dart';

abstract class HowToEvent extends Equatable {
  const HowToEvent();

  @override
  List<Object> get props => [];
}

class IndexChanged extends HowToEvent {}

class SectionVisibilityChanged extends HowToEvent {}

class IndexManuallyChanged extends HowToEvent  {
  final int selectedIndex;

  const IndexManuallyChanged({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];

  @override
  String toString() => 'IndexManuallyChanged { selectedIndex: $selectedIndex }';
}
