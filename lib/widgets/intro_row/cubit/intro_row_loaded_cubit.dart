import 'package:bloc/bloc.dart';

class IntroRowLoadedCubit extends Cubit<bool> {
  IntroRowLoadedCubit() : super(false);

  void loaded() => emit(true);
}
