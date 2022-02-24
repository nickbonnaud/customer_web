import 'package:bloc/bloc.dart';

class TextLoadedCubit extends Cubit<bool> {
  TextLoadedCubit() : super(false);

  void loaded() => emit(true);
}
