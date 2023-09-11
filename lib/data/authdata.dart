import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_comic/utils/constants.dart';

class AuthData {
  Future<Either<String, String>> login(
      {required String identifier, required String pass}) async {
    try {
      var response = await Dio().post(
        "${Constant.baseUrl}/api/auth/local/",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "identifier": identifier,
          "password": pass,
        },
      );
      if (response.statusCode == 200) {
        return Right(response.data['jwt']);
      } else {
        return const Left("something wrong");
      }
    } catch (e) {
      return Left("something wrong $e");
    }
  }

  Future<Either<String, String>> register(
      {required String username,
      required String email,
      required String password}) async {
    try {
      var response = await Dio().post(
        "${Constant.baseUrl}/api/auth/local/register",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "username": username,
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return Right(response.data['jwt']);
      } else {
        return const Left("something wrong");
      }
    } catch (e) {
      return Left("something wrong $e");
    }
  }
}
