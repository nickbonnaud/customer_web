part of 'intro_widgets_loaded_bloc.dart';

@immutable
class IntroWidgetsLoadedState extends Equatable {
  final bool planetsLoaded;
  final bool spaceShipLoaded;
  final bool spaceStationLoaded;
  final bool qrCodeLoaded;
  final bool logoLoaded;
  final bool phoneImageLoaded;

  final bool loadingLogoLoaded;
  final bool overlayAnimationPlayed;

  bool get widgetsLoaded => planetsLoaded &&
    spaceShipLoaded &&
    spaceStationLoaded &&
    qrCodeLoaded &&
    logoLoaded &&
    phoneImageLoaded;

  const IntroWidgetsLoadedState({
    required this.planetsLoaded,
    required this.spaceShipLoaded,
    required this.spaceStationLoaded,
    required this.qrCodeLoaded,
    required this.logoLoaded,
    required this.phoneImageLoaded,

    required this.loadingLogoLoaded,
    required this.overlayAnimationPlayed
  });

  factory IntroWidgetsLoadedState.initial() {
    return const IntroWidgetsLoadedState(
      planetsLoaded: false,
      spaceShipLoaded: false,
      spaceStationLoaded: false,
      qrCodeLoaded: false,
      logoLoaded: false,
      phoneImageLoaded: false,

      loadingLogoLoaded: false,
      overlayAnimationPlayed: false
    );
  }

  IntroWidgetsLoadedState update({
    bool? planetsLoaded,
    bool? spaceShipLoaded,
    bool? spaceStationLoaded,
    bool? qrCodeLoaded,
    bool? logoLoaded,
    bool? phoneImageLoaded,

    bool? loadingLogoLoaded,
    bool? overlayAnimationPlayed
  }) {
    return IntroWidgetsLoadedState(
      planetsLoaded: planetsLoaded ?? this.planetsLoaded,
      spaceShipLoaded: spaceShipLoaded ?? this.spaceShipLoaded,
      spaceStationLoaded: spaceStationLoaded ?? this.spaceStationLoaded,
      qrCodeLoaded: qrCodeLoaded ?? this.qrCodeLoaded,
      logoLoaded: logoLoaded ?? this.logoLoaded,
      phoneImageLoaded: phoneImageLoaded ?? this.phoneImageLoaded,

      loadingLogoLoaded: loadingLogoLoaded ?? this.loadingLogoLoaded,
      overlayAnimationPlayed: overlayAnimationPlayed ?? this.overlayAnimationPlayed
    );
  }
  
  @override
  List<Object> get props => [
    planetsLoaded,
    spaceShipLoaded,
    spaceStationLoaded,
    qrCodeLoaded,
    logoLoaded,
    phoneImageLoaded,

    loadingLogoLoaded,
    overlayAnimationPlayed
  ];

  @override
  String toString() => '''IntroWidgetsLoadedState {
    planetsLoaded: $planetsLoaded,
    spaceShipLoaded: $spaceShipLoaded,
    spaceStationLoaded: $spaceStationLoaded,
    qrCodeLoaded: $qrCodeLoaded,
    logoLoaded: $logoLoaded,
    phoneImageLoaded: $phoneImageLoaded,
    
    loadingLogoLoaded: $loadingLogoLoaded,
    overlayAnimationPlayed: $overlayAnimationPlayed
  }''';
}
