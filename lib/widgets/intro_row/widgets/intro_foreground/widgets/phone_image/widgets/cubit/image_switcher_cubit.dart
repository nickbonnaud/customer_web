import 'package:bloc/bloc.dart';

class ImageSwitcherCubit extends Cubit<int> {
  ImageSwitcherCubit() : super(0);

  void changeImage() => emit(state + 1);
}
