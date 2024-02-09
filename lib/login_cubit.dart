import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/cookie_page.dart';
import 'api_url.dart';
import 'dio_helper.dart';
import 'LoginModel.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  DioHelper _dioHelper = DioHelper();
  LoginModel loginModel = LoginModel();

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final response = await _dioHelper.postData(
        path: ApiUrl.login,
        body: {
          "email": email,
          "password": password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        Get.offAll(CookiePage());
        emit(LoginSuccessState());
      } else {
        Get.snackbar("Error", loginModel.message ?? "",
            backgroundColor: Color(0xff8b1c14));
        emit(LoginErrorState());
      }
    } catch (e) {
      emit(LoginErrorState());
    }
  }
}
