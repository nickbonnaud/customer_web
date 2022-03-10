import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'explanation_event.dart';
part 'explanation_state.dart';

class ExplanationBloc extends Bloc<ExplanationEvent, ExplanationState> {
    static const String brainAnimation = 'lotties/brain.zip';
    static const String coinsAnimation = 'lotties/coins.zip';
    static const String invoiceAnimation = 'lotties/invoice.zip';
    static const String rocketAnimation = 'lotties/rocket.zip';
  
  ExplanationBloc() : super(ExplanationState.initial()) {
    _eventHandler();
  }

  void _eventHandler() {
    on<AnimationPlayed>((event, emit) => _mapAnimationPlayedToState(event: event, emit: emit));
  }

  void _mapAnimationPlayedToState({required AnimationPlayed event, required Emitter<ExplanationState> emit}) {
    switch (event.animation) {
      case brainAnimation:
        emit(state.update(brainPlayed: true));
        break;
      case coinsAnimation:
        emit(state.update(coinsPlayed: true));
        break;
      case invoiceAnimation:
        emit(state.update(invoicePlayed: true));
        break;
      case rocketAnimation:
        emit(state.update(rocketPlayed: true));
        break;
    }
  }

  bool animationPlayed({required String animation}) {
    switch (animation) {
      case brainAnimation:
        return state.brainPlayed;
      case coinsAnimation:
        return state.coinsPlayed;
      case invoiceAnimation:
        return state.invoicePlayed;
      case rocketAnimation:
        return state.rocketPlayed;
      default:
        return false;
    }
  }
}
