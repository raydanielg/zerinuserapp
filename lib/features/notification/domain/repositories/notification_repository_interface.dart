import 'package:zerin_express/interface/repository_interface.dart';

abstract class NotificationRepositoryInterface implements RepositoryInterface{
  Future<dynamic> sendReadStatus(int notificationId);
}