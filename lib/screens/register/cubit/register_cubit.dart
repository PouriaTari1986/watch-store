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
import 'package:geolocator/geolocator.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio _dio = Dio();

  Future<void> pickLocation({required BuildContext context}) async {
    try {
      // چک کردن پرمیشن
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          emit(ErrorState());
          return;
        }
      }

      // انتخاب لوکیشن از روی نقشه
      GeoPoint? value = await showSimplePickerLocation(
        // ignore: use_build_context_synchronously
        context: context,
        isDismissible: true,
        title: "انتخاب موقعیت مکانی",
        textCancelPicker: "لغو",
        textConfirmPicker: "انتخاب",
        zoomOption: ZoomOption(initZoom: 8),
        initCurrentUserPosition: UserTrackingOption.withoutUserPosition(),
        radius: 8.0,
      );

      if (value != null) {
        List<Placemark> placeMark = await placemarkFromCoordinates(
          value.latitude,
          value.longitude,
        );

        Placemark place = placeMark.first;

        String address =
            "${place.street ?? ""}, ${place.locality ?? ""}, ${place.subAdministrativeArea ?? ""}, ${place.administrativeArea ?? ""}, ${place.country ?? ""}";

        debugPrint("📍 آدرس انتخاب شده: $address");
        emit(LocationPickedState(location: value, address: address));
      }
    } catch (e) {
      debugPrint("❌ خطا در pickLocation: $e");
      emit(ErrorState());
    }
  }

  Future<void> register({required User user}) async {
    emit(LoadingState());

    try {
      String? token = SharedPreferencesManager().getString(
        SharedPrefrencesConst.token,
      );
      _dio.options.headers["Authorization"] = "Bearer $token";

      final response = await _dio.post(
        EndPoints.register,
        data: FormData.fromMap(user.toMap()),
      );

      if (response.statusCode == 201) {
        emit(OkResponseState());
      } else {
        debugPrint("❌ ثبت نام با خطا: ${response.statusCode}");
        emit(ErrorState());
      }
    } catch (e) {
      debugPrint("❌ خطا در ثبت‌نام: $e");
      emit(ErrorState());
    }
  }
}
