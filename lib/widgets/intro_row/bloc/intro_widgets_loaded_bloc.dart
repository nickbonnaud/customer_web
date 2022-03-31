import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'intro_widgets_loaded_event.dart';
part 'intro_widgets_loaded_state.dart';

class IntroWidgetsLoadedBloc extends Bloc<IntroWidgetsLoadedEvent, IntroWidgetsLoadedState> {
  IntroWidgetsLoadedBloc() : super(IntroWidgetsLoadedState.initial()) {
    _eventHandler();
  }

  void _eventHandler() {
    on<PlanetsLoaded>((event, emit) => _handlePlanetsLoadedToState(emit: emit));
    on<SpaceShipLoaded>((event, emit) => _handleSpaceShipLoadedToState(emit: emit));
    on<SpaceStationLoaded>((event, emit) => _handleSpaceStationLoadedToState(emit: emit));
    on<QrCodeLoaded>((event, emit) => _handleQrCodeLoadedToState(emit: emit));
    on<LogoLoaded>((event, emit) => _handleLogoLoadedToState(emit: emit));
    on<PhoneImageLoaded>((event, emit) => _handlePhoneImageLoadedToState(emit: emit));
    on<OverlayAnimationPlayed>((event, emit) => _handleOverlayAnimationPlayedToState(emit: emit));
    on<LoadingLogoLoaded>((event, emit) => _mapLoadingLogoLoadedToState(emit: emit));
  }

  void _handlePlanetsLoadedToState({required Emitter<IntroWidgetsLoadedState> emit}) {
    emit(state.update(planetsLoaded: true));
  }

  void _handleSpaceShipLoadedToState({required Emitter<IntroWidgetsLoadedState> emit}) {
    emit(state.update(spaceShipLoaded: true));
  }

  void _handleSpaceStationLoadedToState({required Emitter<IntroWidgetsLoadedState> emit}) {
    emit(state.update(spaceStationLoaded: true));
  }

  void _handleQrCodeLoadedToState({required Emitter<IntroWidgetsLoadedState> emit}) {
    emit(state.update(qrCodeLoaded: true));
  }

  void _handleLogoLoadedToState({required Emitter<IntroWidgetsLoadedState> emit}) {
    emit(state.update(logoLoaded: true));
  }

  void _handlePhoneImageLoadedToState({required Emitter<IntroWidgetsLoadedState> emit}) {
    emit(state.update(phoneImageLoaded: true));
  }

  void _handleOverlayAnimationPlayedToState({required Emitter<IntroWidgetsLoadedState> emit}) {
    emit(state.update(overlayAnimationPlayed: true));
  }

  void _mapLoadingLogoLoadedToState({required Emitter<IntroWidgetsLoadedState> emit}) {
    emit(state.update(loadingLogoLoaded: true));
  }
}
