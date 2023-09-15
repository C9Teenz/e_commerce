import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_comic/data/localdata.dart';
import 'package:e_commerce_comic/utils/constants.dart';

import '../models/request_order_model.dart';
import '../models/response_order_model.dart';

class OrderData {
  Future<Either<String, String>> order(RequestOrderModel datas) async {
    try {
      String token = await LocalData.getToken();
      var response = await Dio().post("${Constant.baseUrl}/api/orders",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $token'
            },
          ),
          data: requestOrderModelToJson(datas));
      String urlPayment = response.data["redirect_url"];
      return Right(urlPayment);
    } catch (e) {
      return Left("$e");
    }
  }

  Future<Either<String, List<ResponseOrder>>> waitingPaymentData() async {
    try {
      String token = await LocalData.getToken();
      String id = await LocalData.getId();
      var response = await Dio().get(
        "${Constant.baseUrl}/api/orders?populate%5Buser%5D%5Bfields%5D%5B0%5D=username&filters[user][id][\$eq]=$id&filters[statusOrder][\$eq]=waitingPayment",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer $token"
          },
        ),
      );
      return Right(ResponseOrderModel.fromJson(response.data).data);
    } catch (e) {
      return Left("$e");
    }
  }

  Future<Either<String, List<ResponseOrder>>> purchasedData() async {
    try {
      String token = await LocalData.getToken();
      String id = await LocalData.getId();
      var response = await Dio().get(
        "${Constant.baseUrl}/api/orders?populate%5Buser%5D%5Bfields%5D%5B0%5D=username&filters[user][id][\$eq]=$id&filters[statusOrder][\$eq]=purchased",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer $token"
          },
        ),
      );
      return Right(ResponseOrderModel.fromJson(response.data).data);
    } catch (e) {
      return Left("$e");
    }
  }
}
