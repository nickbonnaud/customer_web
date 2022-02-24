import 'package:bloc/bloc.dart';


class PlanetsLoadedCubit extends Cubit<bool> {
  PlanetsLoadedCubit() : super(false);

  void loaded() => emit(true);
}
