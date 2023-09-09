// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:e_commerce_comic/data/remotedata.dart';
import 'package:e_commerce_comic/models/comic_model.dart';

part 'getcomic_cubit.freezed.dart';
part 'getcomic_state.dart';

class GetcomicCubit extends Cubit<GetcomicState> {
  GetcomicCubit(
    this.data,
  ) : super(const _Initial());
  final RemoteData data;
  void get() async {
    emit(const _Loading());
    final result = await data.getData(page: 1);
    result.fold((l) => emit(_Error(l)), (r) {
      bool isnext = r.data.length == 10;
      emit(_Loaded(r.data, 1, isnext));
    });
  }

  void getNext(int page) async {
    page = page + 1;
    final result = await data.getData(page: page);
    result.fold((l) => emit(_Error(l)), (r) {
      bool isnext = r.data.length == 10;
      emit(_Loaded(r.data, page, isnext));
    });
  }

  void getSearch(String name) async {
    emit(const _Loading());
    final result = await data.getSearchData(name);
    result.fold((l) => emit(_Error(l)), (r) {
      bool isnext = r.length == 10;
      emit(_Loaded(r, 1, isnext));
    });
  }

  void getFilter(String name) async {
    emit(const _Loading());
    final result = await data.getFilterData(name);
    result.fold((l) => emit(_Error(l)), (r) {
      bool isnext = r.length == 10;
      emit(_Loaded(r, 1, isnext));
    });
  }
}
