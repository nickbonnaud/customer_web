part of 'explanation_bloc.dart';

@immutable
class ExplanationState extends Equatable {
  final bool brainPlayed;
  final bool coinsPlayed;
  final bool invoicePlayed;
  final bool rocketPlayed;

  const ExplanationState({
    required this.brainPlayed,
    required this.coinsPlayed,
    required this.invoicePlayed,
    required this.rocketPlayed
  });

  factory ExplanationState.initial() {
    return const ExplanationState(
      brainPlayed: false,
      coinsPlayed: false,
      invoicePlayed: false,
      rocketPlayed: false
    );
  }

  ExplanationState update({
    bool? brainPlayed,
    bool? coinsPlayed,
    bool? invoicePlayed,
    bool? rocketPlayed
  }) {
    return ExplanationState(
      brainPlayed: brainPlayed ?? this.brainPlayed,
      coinsPlayed: coinsPlayed ?? this.coinsPlayed,
      invoicePlayed: invoicePlayed ?? this.invoicePlayed,
      rocketPlayed: rocketPlayed ?? this.rocketPlayed
    );
  }
  
  @override
  List<Object> get props => [
    brainPlayed,
    coinsPlayed,
    invoicePlayed,
    rocketPlayed
  ];

  @override
  String toString() => '''ExplanationState {
    brainPlayed: $brainPlayed,
    coinsPlayed: $coinsPlayed,
    invoicePlayed: $invoicePlayed,
    rocketPlayed: $rocketPlayed
  }''';
}
