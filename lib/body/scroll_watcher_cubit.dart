import 'package:bloc/bloc.dart';

class ScrollWatcherCubit extends Cubit<double> {
  ScrollWatcherCubit() : super(0);

  void scrolled({required double offset}) => emit(offset);
}
