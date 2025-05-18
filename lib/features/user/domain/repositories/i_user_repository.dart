import 'package:code_base/features/user/domain/entity/user_list.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';

abstract class IUserRepository {
  Future<Either<Failure, UserList>> getUsers({required int page, required int perPage});
}
