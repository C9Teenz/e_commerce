part of 'purchased_order_cubit.dart';


@Freezed(makeCollectionsUnmodifiable: false)
class PurchasedOrderState with _$PurchasedOrderState {
  const factory PurchasedOrderState.initial() = _Initial;
  const factory PurchasedOrderState.loading() = _Loading;
  const factory PurchasedOrderState.loaded(List<ResponseOrder> data) = _Loaded;
  const factory PurchasedOrderState.error(String error) = _Error;
}
