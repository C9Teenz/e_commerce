import 'package:bloc/bloc.dart';
import 'package:e_commerce_comic/data/localdata.dart';
import 'package:e_commerce_comic/models/cartmodel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  void addData(CartModel data) async {
    var datas = await LocalData.getCart();
    // ignore: prefer_typing_uninitialized_variables
    var addData = _Loaded(cartModelFromJson(datas));

    // print(addData.model);
    // addData.model.add(data);
    // await LocalData.saveCart(cartModelToJson(addData.model));
    // print(addData.model);
    // emit(_Loaded(addData.model));

    bool isDuplicate = false;
    int index = -1;
    // Periksa apakah data dengan 'value' yang sama sudah ada
    for (var datas in addData.model) {
      if (datas.id == data.id) {
        isDuplicate = true;
        index = addData.model.indexOf(datas);
        addData.model[index].qty += data.qty;
        await LocalData.saveCart(cartModelToJson(addData.model));
        emit(addData);
        break; // Hentikan iterasi jika data yang sama ditemukan
      }
    }

    // Jika tidak ada data yang sama, tambahkan newData
    if (!isDuplicate) {
      addData.model.add(data);
      await LocalData.saveCart(cartModelToJson(addData.model));
      emit(addData);
    }
  }

  void getCart() {
    LocalData.getCart().then((value) {
      var data = cartModelFromJson(value);
      emit(_Loaded(data));
    });
  }

  void incrementItem(int id) async {
    var datas = await LocalData.getCart();
    // ignore: prefer_typing_uninitialized_variables
    var addData = _Loaded(cartModelFromJson(datas));
    int index = -1;
    for (var data in addData.model) {
      if (data.id == id) {
        index = addData.model.indexOf(data);
        addData.model[index].qty += 1;
        LocalData.saveCart(cartModelToJson(addData.model));
        emit(addData);
        break;
      }
    }
  }

  void decrementItem(int id) async {
    var datas = await LocalData.getCart();
    // ignore: prefer_typing_uninitialized_variables
    var addData = _Loaded(cartModelFromJson(datas));
    int index = -1;
    for (var data in addData.model) {
      if (data.id == id) {
        index = addData.model.indexOf(data);
        addData.model[index].qty -= 1;
        LocalData.saveCart(cartModelToJson(addData.model));
        emit(addData);
        break;
      }
    }
  }

  void deleteItems(List<CartModel> input) async {
    var datas = await LocalData.getCart();
    // ignore: prefer_typing_uninitialized_variables
    var sisaData = _Loaded(cartModelFromJson(datas));
    sisaData.model.removeWhere((element) {
      return input.any((item) => element.id == item.id);
    });
    await LocalData.saveCart(cartModelToJson(sisaData.model));
    emit(sisaData);
  }

  void deleteItem(CartModel input)async{
    var datas = await LocalData.getCart();
    // ignore: prefer_typing_uninitialized_variables
    var sisaData = _Loaded(cartModelFromJson(datas));
    sisaData.model.removeWhere((element) => element.id == input.id);
    await LocalData.saveCart(cartModelToJson(sisaData.model));
    emit(sisaData);
  }
}
