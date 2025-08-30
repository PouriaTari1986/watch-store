import 'package:bloc/bloc.dart';
import 'package:di_state_managment/data/source/constant.dart';
import 'package:di_state_managment/utils/response_validator.dart';
import 'package:di_state_managment/utils/shared_preferences_manager.dart';
import 'package:di_state_managment/utils/shared_prefrences_const.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_state.dart';




class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  








  final Dio _dio = Dio();

  /// ارسال SMS
  void sendSms(String mobile) async {
    emit(LoadingState());
    try {
      final response = await _dio.post(
        EndPoints.sendSms,
        data: {"mobile": mobile},
      );
      if (HttpResponseValidator.isValidStatusCode(response.statusCode??0)) {
        final code = response.data["data"]["code"];
         debugPrint("📩 کد تایید از سرور: $code");
        emit(LoadedState(mobile: mobile));
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  /// تایید کد SMS
  void verifyCode(String mobile, String code) async {
    emit(LoadingState());
    try {
      final response = await _dio.post(
        EndPoints.checkSmsCode,
        data: {"mobile": mobile, "code": code},
      );
      if (HttpResponseValidator.isValidStatusCode(response.statusCode??0)){
        final data = response.data["data"];
        final token = data["token"];
        if (token != null && token.isNotEmpty) {

        await  SharedPreferencesManager().saveString(
          SharedPrefrencesConst.token,token
        );
        }
        
      
        SharedPreferencesManager().getString(SharedPrefrencesConst.token);
        if (response.data["data"]["is_registered"]) {
          emit(VerifiedIsRegisterdeState());
        } else {
          emit(VerifiedIsNotRegisterdeState());
        }
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  /// ورود با گوگل
}
