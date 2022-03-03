import 'package:bloc/bloc.dart';


class DownloadButtonLoadedCubit extends Cubit<bool> {
  DownloadButtonLoadedCubit() : super(false);

  void loaded() => emit(true);
}
