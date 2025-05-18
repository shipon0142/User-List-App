import 'package:code_base/features/user/data/models/user_list_model/user_list_model.dart';


abstract class IUserDataSource {

  Future<UserListModel> getUserList({required int page,required int perPage});

}
