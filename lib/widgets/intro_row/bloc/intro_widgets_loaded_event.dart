part of 'intro_widgets_loaded_bloc.dart';

abstract class IntroWidgetsLoadedEvent extends Equatable {
  const IntroWidgetsLoadedEvent();

  @override
  List<Object> get props => [];
}

class PlanetsLoaded extends IntroWidgetsLoadedEvent {}

class SpaceShipLoaded extends IntroWidgetsLoadedEvent {}

class SpaceStationLoaded extends IntroWidgetsLoadedEvent {}

class QrCodeLoaded extends IntroWidgetsLoadedEvent {}

class LogoLoaded extends IntroWidgetsLoadedEvent {}

class PhoneImageLoaded extends IntroWidgetsLoadedEvent {}


class LoadingLogoLoaded extends IntroWidgetsLoadedEvent {}

class OverlayAnimationPlayed extends IntroWidgetsLoadedEvent {}
