import 'package:bloc/bloc.dart';
import 'package:di_state_managment/data/models/user.dart';
import 'package:di_state_managment/data/source/constant.dart';
import 'package:di_state_managment/utils/shared_preferences_manager.dart';
import 'package:di_state_managment/utils/shared_prefrences_const.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geocoding/geocoding.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio _dio = Dio();

  // ignore: strict_top_level_inference
  Future<void> pickLocation({required BuildContext context})async{
    GeoPoint? value =
    await showSimplePickerLocation(
      context: context,
      isDismissible: true,
      title: "انتخاب موقعیت مکانی",
      textCancelPicker: "لغو",
      textConfirmPicker: "انتخاب",
      zoomOption: ZoomOption(initZoom: 8),
      initCurrentUserPosition: UserTrackingOption.withoutUserPosition(),
      radius: 8.0
      );
      if (value != null) {
        List<Placemark> placeMark = await placemarkFromCoordinates(
          value.latitude, value.longitude);

          Placemark place = placeMark.first;
          String address = 
          "${place.street},${place.locality},${place.administrativeArea}";
          emit(LocationPickedState(location: value, address:address));
      }
  }

  Future<void> register({required User user})async{

    emit(LoadingState());

    try {
      String? token = SharedPreferencesManager().getString(SharedPrefrencesConst.token);
      _dio.options.headers["Authorization"] = "Bearer $token";
      await _dio.post(EndPoints.register,
      data: FormData.fromMap(user.toMap())).then((value){
        
        if (value.statusCode == 201) {
          emit(OkResponseState());
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }

  }
}
