import 'package:bloc/bloc.dart';

class PhoneImageLoadedCubit extends Cubit<bool> {
  PhoneImageLoadedCubit() : super(false);

  void loaded() => emit(true);
}
