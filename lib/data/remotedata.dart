import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_comic/models/comic_model.dart';
import 'package:e_commerce_comic/utils/constants.dart';

class RemoteData {
  Future<Either<String, ComicModel>> getData({required int page}) async {
    try {
      var response = await Dio().get(
        "${Constant.baseUrl}/api/comics?populate%5Bauthor%5D%5Bfields%5D%5B0%5D=name&populate%5Bgenres%5D%5Bfields%5D%5B0%5D=name&populate%5Bimages%5D%5Bfields%5D%5B0%5D=url&pagination[page]=$page&pagination[pageSize]=10",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      return Right(ComicModel.fromJson(response.data));
    } catch (e) {
      return Left("$e");
    }
  }

  Future<Either<String, List<ComicModelDatum>>> getSearchData(
      String name) async {
    try {
      var response = await Dio().get(
        "${Constant.baseUrl}/api/comics?populate%5Bauthor%5D%5Bfields%5D%5B0%5D=name&populate%5Bgenres%5D%5Bfields%5D%5B0%5D=name&populate%5Bimages%5D%5Bfields%5D%5B0%5D=url&filters[comic_name][\$contains]=$name",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      return Right(ComicModel.fromJson(response.data).data);
    } catch (e) {
      return Left("$e");
    }
  }

  Future<Either<String, List<ComicModelDatum>>> getFilterData(
      String name) async {
    try {
      var response = await Dio().get(
        "${Constant.baseUrl}/api/comics?populate%5Bauthor%5D%5Bfields%5D%5B0%5D=name&populate%5Bgenres%5D%5Bfields%5D%5B0%5D=name&populate%5Bimages%5D%5Bfields%5D%5B0%5D=url&filters[genres][name][\$eq]=$name",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      return Right(ComicModel.fromJson(response.data).data);
    } catch (e) {
      return Left("$e");
    }
  }
}
