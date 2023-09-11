import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_comic/data/localdata.dart';
import 'package:e_commerce_comic/models/user_model.dart';
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
        print(response.data['jwt']);
        return Right(response.data['jwt']);
      } else {
        return const Left("something wrong");
      }
    } catch (e) {
      return Left("something wrong $e");
    }
  }

  Future<Either<String, UserModel>> getUser() async {
    try {
      String token = await LocalData.getToken();
      var response = await Dio().get(
        "${Constant.baseUrl}/api/users/me",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      if (response.statusCode == 200) {
        return Right(UserModel.fromJson(response.data));
      } else {
        return const Left("something wrong");
      }
    } catch (e) {
      return Left("something wrong $e");
    }
  }
}
