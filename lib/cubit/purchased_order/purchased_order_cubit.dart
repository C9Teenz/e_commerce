import 'package:bloc/bloc.dart';
import 'package:e_commerce_comic/data/orderdata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/response_order_model.dart';

part 'purchased_order_state.dart';
part 'purchased_order_cubit.freezed.dart';

class PurchasedOrderCubit extends Cubit<PurchasedOrderState> {
  PurchasedOrderCubit() : super(const PurchasedOrderState.initial());

  void get() async {
    emit(const PurchasedOrderState.loading());
    final result = await OrderData().purchasedData();
    result.fold((l) => emit(PurchasedOrderState.error(l)), (r) {
      emit(PurchasedOrderState.loaded(r));
    });
  }
}
