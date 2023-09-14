import 'package:bloc/bloc.dart';


class UrlPaymentCubit extends Cubit<List<String>> {
  UrlPaymentCubit() : super([]);

  void addUrl(String url) {
    List<String> list = state;
    list.add(url);
    emit(list);
  }

  void deleteUrl(String url){
    List<String> list = state;
    for(var data in list){
      if(data==url){
        list.remove(data);
        break;
      }
    }
    emit(list);
  }
}
