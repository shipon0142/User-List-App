import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<User>>> getUsers();
}
