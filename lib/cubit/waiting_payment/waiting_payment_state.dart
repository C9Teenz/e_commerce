part of 'waiting_payment_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
//agar bisa di rubah datanya

class WaitingPaymentState with _$WaitingPaymentState {
  const factory WaitingPaymentState.initial() = _Initial;
  const factory WaitingPaymentState.loading() = _Loading;
  const factory WaitingPaymentState.loaded(List<ResponseOrder> data) = _Loaded;
  const factory WaitingPaymentState.error(String error) = _Error;
}
