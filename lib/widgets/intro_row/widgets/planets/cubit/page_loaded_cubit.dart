import 'package:bloc/bloc.dart';


class PageLoadedCubit extends Cubit<bool> {
  PageLoadedCubit() : super(false);

  void loaded() => emit(true);
}
