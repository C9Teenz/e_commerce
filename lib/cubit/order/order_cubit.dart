import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/orderdata.dart';
import '../../models/request_order_model.dart';

part 'order_state.dart';
part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderState.initial());

  void addOrder (RequestOrderModel data){
    emit(const OrderState.loading());
    
    OrderData().order(data).then((value) {
      value.fold((l) => emit(OrderState.error(l)), (r) => emit(OrderState.loaded(r)));
    });

  }
}
