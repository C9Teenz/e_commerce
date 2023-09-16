// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:e_commerce_comic/data/authdata.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this.data,
  ) : super(const _Initial());
  final AuthData data;
  void register(
      {required String username,
      required String email,
      required String password}) async {
    emit(const _Loading());
    final res = await data.register(
        username: username, email: email, password: password);
    res.fold((l) => emit(_Error(l)), (r) {
      emit(_Loaded(r));
    });
  }
}
