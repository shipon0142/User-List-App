import 'package:assignment/core/network/error_handler.dart';
import 'package:assignment/core/network/network_info.dart';
import 'package:assignment/features/user/data/data_sources/i_user_data_source.dart';
import 'package:assignment/features/user/domain/entity/user.dart';
import 'package:assignment/features/user/domain/entity/user_list.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../domain/repositories/i_user_repository.dart';

class UserRepository extends IUserRepository {
  final IUserDataSource iDataSource;
  final NetworkInfo networkInfo;

  UserRepository({required this.iDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserList>> getUsers({required int page, required int perPage}) async {
    if (await networkInfo.isConnected) {
      try {
        UserList result = await iDataSource.getUserList(page: page,perPage: perPage);
        return Right(result);
      } on Exception catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
