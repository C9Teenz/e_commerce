import 'package:flutter_bloc/flutter_bloc.dart';



class FiltergenreCubit extends Cubit<int> {
  FiltergenreCubit() : super(0);

  void changeIndex(int index)=>emit(index);
}
