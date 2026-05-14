import 'package:zerin_express/features/address/domain/models/address_model.dart';
import 'package:zerin_express/interface/repository_interface.dart';

abstract class AddressRepositoryInterface implements RepositoryInterface<Address>{
  Future<dynamic> updateLastLocation(String lat, String lng, String zoneID);
}