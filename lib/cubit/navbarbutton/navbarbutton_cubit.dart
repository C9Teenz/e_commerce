import 'package:flutter_bloc/flutter_bloc.dart';


class NavbarbuttonCubit extends Cubit<int> {
  NavbarbuttonCubit() : super(0);

  void changeIndex(int index) => emit(index);
}
