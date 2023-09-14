import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_comic/data/localdata.dart';
import 'package:e_commerce_comic/utils/constants.dart';

import '../models/request_order_model.dart';

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
}
