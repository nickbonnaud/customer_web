import 'package:bloc/bloc.dart';

class QrCodeLoadedCubit extends Cubit<bool> {
  QrCodeLoadedCubit() : super(false);

  void loaded() => emit(true);
}
