// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:e_commerce_comic/data/authdata.dart';
import 'package:e_commerce_comic/models/user_model.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.data,
  ) : super(const _Initial());
  final AuthData data;
  void get() async {
    emit(const _Loading());
    final res = await data.getUser();
    res.fold((l) => emit(_Error(l)), (r) {
      print(r);
      emit(_Loaded(r));
    });
  }
}
