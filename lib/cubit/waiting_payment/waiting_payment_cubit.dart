import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/orderdata.dart';
import '../../models/response_order_model.dart';

part 'waiting_payment_state.dart';
part 'waiting_payment_cubit.freezed.dart';

class WaitingPaymentCubit extends Cubit<WaitingPaymentState> {
  WaitingPaymentCubit() : super(const WaitingPaymentState.initial());

  void get() async {
    emit(const _Loading());
    final result = await OrderData().waitingPaymentData();
    result.fold((l) => emit(_Error(l)), (r) {
      emit(_Loaded(r));
    });
  }
}
