import 'package:assignment/features/user/data/models/user_model.dart';


abstract class IUserDataSource {

  Future<List<UserModel>> getUserList();

}
