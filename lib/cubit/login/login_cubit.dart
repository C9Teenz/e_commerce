// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_comic/data/localdata.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:e_commerce_comic/data/authdata.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.data,
  ) : super(const _Initial());
  final AuthData data;

  void login({required String email, required String pass}) async {
    emit(const _Loading());
    final res = await data.login(identifier: email, pass: pass);
    res.fold((l) => emit(_Error(l)), (r) {
      LocalData.saveToken(r).then(
        (value) => emit(_Loaded(r)),
      );
    });
  }
}
