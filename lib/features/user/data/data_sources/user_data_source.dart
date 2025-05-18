

import 'package:code_base/features/user/data/api_service/user_api_service.dart';
import 'package:code_base/features/user/data/data_sources/i_user_data_source.dart';
import 'package:code_base/features/user/data/models/user_list_model/user_list_model.dart';
import 'package:code_base/features/user/data/models/user_model/user_model.dart';

class UserDataSource extends IUserDataSource {
  final UserApiService apiService;

  UserDataSource({required this.apiService});

  @override
  Future<UserListModel> getUserList({required int page,required int perPage}) async {
    UserListModel users = await apiService.getUserList(page: page,perPage: perPage);
    return users;
  }
}
