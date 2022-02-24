import 'package:bloc/bloc.dart';

class IntroLogoLoadedCubit extends Cubit<bool> {
  IntroLogoLoadedCubit() : super(false);

  void loaded() => emit(true);
}
