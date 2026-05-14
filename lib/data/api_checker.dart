import 'package:get/get.dart';
import 'package:zerin_express/features/auth/domain/models/error_response.dart';
import 'package:zerin_express/features/splash/controllers/config_controller.dart';
import 'package:zerin_express/helper/display_helper.dart';
import 'package:zerin_express/helper/login_helper.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {
      Get.find<ConfigController>().removeSharedData();
      LoginHelper.checkLoginMedium();

    }else if(response.statusCode == 403) {
      ErrorResponse errorResponse;
      errorResponse = ErrorResponse.fromJson(response.body);
      if(errorResponse.errors != null && errorResponse.errors!.isNotEmpty){
        showCustomSnackBar(errorResponse.errors![0].message!);
      }else{
        showCustomSnackBar(response.body['message']);
      }

    }else if(response.statusCode == 422) {
      ErrorResponse errorResponse;
      errorResponse = ErrorResponse.fromJson(response.body);
      if(errorResponse.errors != null && errorResponse.errors!.isNotEmpty){
        showCustomSnackBar(errorResponse.errors![0].message!);
      }else{
        showCustomSnackBar(response.body['message']);
      }

    }else if(response.statusCode == 500){
      showCustomSnackBar(response.statusText!);
    }else {
      showCustomSnackBar(response.statusText!);
    }
  }
}
