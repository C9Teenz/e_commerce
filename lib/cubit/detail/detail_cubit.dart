import 'package:flutter_bloc/flutter_bloc.dart';


class DetailCubit extends Cubit<int> {
  DetailCubit() : super(0);

   void changeIndex(int index) => emit(index);
}
