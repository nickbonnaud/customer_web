import 'package:bloc/bloc.dart';

class SpaceShipLoadedCubit extends Cubit<bool> {
  SpaceShipLoadedCubit() : super(false);

  void loaded() => emit(true);
}
