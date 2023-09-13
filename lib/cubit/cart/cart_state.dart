part of 'cart_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded(List<CartModel> model) = _Loaded;
  const factory CartState.error() = _Error;
}
