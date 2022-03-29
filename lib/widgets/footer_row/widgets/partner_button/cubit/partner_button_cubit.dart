import 'package:bloc/bloc.dart';

class PartnerButtonCubit extends Cubit<bool> {
  PartnerButtonCubit() : super(false);

  void hoverStatusChanged({required bool isFocused}) => emit(isFocused);
}
