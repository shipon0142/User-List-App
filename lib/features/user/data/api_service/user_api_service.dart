import 'package:assignment/core/network/api_config.dart';
import 'package:assignment/features/user/data/models/user_list_model/user_list_model.dart';
import 'package:assignment/features/user/data/models/user_model/user_model.dart';
import 'package:assignment/features/user/domain/entity/user_list.dart';
import 'package:dio/dio.dart';

class UserApiService {
  final Dio _dio;

  UserApiService(this._dio);

  Future<UserListModel> getUserList({required int page, required int perPage}) async {
    final response = await _dio.get(
      APIConfig.kBaseUrl,
      queryParameters: {
        'page': page,
        'per_page': perPage,
      },
    );

    return UserListModel.fromJson(response.data);


  }
}
