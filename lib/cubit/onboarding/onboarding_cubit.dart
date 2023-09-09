import 'package:flutter_bloc/flutter_bloc.dart';



class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);
  newPage(int index){
    emit(index);
  }
}
