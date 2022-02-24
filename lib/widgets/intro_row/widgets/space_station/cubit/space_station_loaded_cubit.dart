import 'package:bloc/bloc.dart';


class SpaceStationLoadedCubit extends Cubit<bool> {
  SpaceStationLoadedCubit() : super(false);

  void loaded() => emit(true);
}
