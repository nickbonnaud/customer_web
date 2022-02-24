import 'package:bloc/bloc.dart';

class ImageSwitcherCubit extends Cubit<int> {
  static const List<String> imageAssets = [
    'mock_ups/screen_0.png',
    'mock_ups/screen_1.png',
    'mock_ups/screen_2.png',
    'mock_ups/screen_3.png'
  ];
  ImageSwitcherCubit() : super(0);

  void changeImage() => emit(state + 1);
}
