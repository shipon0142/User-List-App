import 'package:assignment/core/network/api_config.dart';
import 'package:assignment/features/user/data/models/user_model.dart';
import 'package:dio/dio.dart';

class UserApiService {
  final Dio _dio;

  UserApiService(this._dio);

  Future<List<UserModel>> getUserList() async {
    final response =
        await _dio.get(APIConfig.kBaseUrl);

    final data = response.data;

    if (data is List) {
      return data.map((item) => UserModel.fromJson(item)).toList();
    } else {
      return [];
    }
  }
}
