part of 'how_to_bloc.dart';

@immutable
class HowToState extends Equatable {
  final int switcherIndex;
  final bool isSectionVisible;
  final bool isManualChange;

  const HowToState({required this.switcherIndex, required this.isSectionVisible, required this.isManualChange});

  factory HowToState.initial() {
    return const HowToState(switcherIndex: 0, isSectionVisible: false, isManualChange: false);
  }

  HowToState update({int? switcherIndex, bool? isSectionVisible, bool? isManualChange}) {
    return HowToState(
      switcherIndex: switcherIndex ?? this.switcherIndex, 
      isSectionVisible: isSectionVisible ?? this.isSectionVisible,
      isManualChange: isManualChange ?? this.isManualChange                             
    );
  }

  @override
  List<Object?> get props => [switcherIndex, isSectionVisible, isManualChange];

  @override
  String toString() => 'HowToState { switcherIndex: $switcherIndex, isSectionVisible: $isSectionVisible, isManualChange: $isManualChange }';
}
