

import 'package:assignment/features/user/data/api_service/user_api_service.dart';
import 'package:assignment/features/user/data/data_sources/i_user_data_source.dart';
import 'package:assignment/features/user/data/models/user_model.dart';

class UserDataSource extends IUserDataSource {
  final UserApiService apiService;

  UserDataSource({required this.apiService});

  @override
  Future<List<UserModel>> getUserList({required int page,required int perPage}) async {
    List<UserModel> users = await apiService.getUserList(page: page,perPage: perPage);
    return users;
  }
}
