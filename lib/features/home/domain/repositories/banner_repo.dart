import 'package:get/get_connect/http/src/response/response.dart';
import 'package:zerin_express/data/api_client.dart';
import 'package:zerin_express/util/app_constants.dart';


class BannerRepo{
  final ApiClient apiClient;

  BannerRepo({required this.apiClient});

  Future<Response?> getBannerList() async {
    return await apiClient.getData(AppConstants.bannerUei);
  }
  Future<Response?> updateBannerClickCount(String bannerId) async {
    return await apiClient.postData(AppConstants.bannerCountUpdate, {
      'banner_id' : bannerId
    });
  }
}