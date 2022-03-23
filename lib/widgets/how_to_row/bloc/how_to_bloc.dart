import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'how_to_event.dart';
part 'how_to_state.dart';

class HowToBloc extends Bloc<HowToEvent, HowToState> {
  static const List<String> imageAssets = [
    'mock_ups/screen_8.png',
    'mock_ups/screen_9.png',
    'mock_ups/screen_10.png',
    'mock_ups/screen_11.png'
  ];

  static const List<String> titleTexts = [
    'Auto Detects Entry',
    'Order Like Normal',
    'Leave When Ready',
    'Smart Auto Pay'
  ];

  static const List<String> bodyTexts = [
    'Nova Pay automatically detects when you enter a business, even if the app was not open!',
    'Ordering works just like normal, no matter the establishment type. Even view your bill in real time!',
    'When you are ready to pay your bill just leave! Nova Pay detects when you leave and closes your bill.',
    'Nova Pay automatically pays your bill for you unless you wish to pay manually through the app.'
  ];
  
  HowToBloc() : super(HowToState.initial()) {
    _eventHandler();
  }

  void _eventHandler() {
    on<IndexChanged>((event, emit) => _mapIndexChangedToState(event: event, emit: emit));
    on<IndexManuallyChanged>((event, emit) => _mapIndexManuallyChangedToState(event: event, emit: emit));
    on<SectionVisibilityChanged>((event, emit) => _mapSectionVisibilityChangedToState(event: event, emit: emit));
  }

  void _mapIndexChangedToState({required IndexChanged event, required Emitter<HowToState> emit}) {
    emit(state.update(switcherIndex: state.switcherIndex + 1, isManualChange: false));
  }

  void _mapIndexManuallyChangedToState({required IndexManuallyChanged event,  required Emitter<HowToState> emit}) {
    emit(state.update(switcherIndex: event.selectedIndex, isManualChange: true));
  }

  void _mapSectionVisibilityChangedToState({required SectionVisibilityChanged event, required Emitter<HowToState> emit}) {
    emit(state.update(isSectionVisible: !state.isSectionVisible));
  }
}
