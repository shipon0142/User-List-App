import 'package:assignment/core/di/di_import_path.dart';
import 'package:assignment/core/local_cache/cache_utils.dart';
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

  UserRepository({
    required this.iDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserList>> getUsers({
    required int page,
    required int perPage,
  }) async {
    final userList = await getUsersFromCache(page: page, perPage: perPage);
    if (userList != null) return Right(userList);

    if (!await networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final result =
          await iDataSource.getUserList(page: page, perPage: perPage);
      await saveUsersToCache(page: page, perPage: perPage, userList: result);
      return Right(result);
    } on Exception catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<UserList?> getUsersFromCache({
    required int page,
    required int perPage,
  }) async {
    final cachedUtils = injector<CacheUtils>();
    final userList =
        await cachedUtils.getUserList('user_list_${page}_$perPage');
    return userList;
  }

  Future<void> saveUsersToCache({
    required int page,
    required int perPage,
    required UserList userList,
  }) async {
    final cachedUtils = injector<CacheUtils>();
    await cachedUtils.saveUserList(userList, 'user_list_${page}_$perPage');
  }
}
