part of 'how_to_bloc.dart';

@immutable
class HowToState extends Equatable {
  final int switcherIndex;
  final bool isSectionVisible;

  const HowToState({required this.switcherIndex, required this.isSectionVisible});

  factory HowToState.initial() {
    return const HowToState(switcherIndex: 0, isSectionVisible: false);
  }

  HowToState update({int? switcherIndex, bool? isSectionVisible}) {
    return HowToState(
      switcherIndex: switcherIndex ?? this.switcherIndex, 
      isSectionVisible: isSectionVisible ?? this.isSectionVisible
    );
  }

  @override
  List<Object?> get props => [switcherIndex, isSectionVisible];

  @override
  String toString() => 'HowToState { switcherIndex: $switcherIndex, isSectionVisible: $isSectionVisible }';
}
