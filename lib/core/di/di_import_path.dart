import 'package:code_base/core/local_cache/cache_utils.dart';
import 'package:code_base/core/network/api_config.dart';
import 'package:code_base/core/network/network_info.dart';
import 'package:code_base/core/utility/constants/constants_manager.dart';
import 'package:code_base/features/user/data/api_service/user_api_service.dart';
import 'package:code_base/features/user/data/data_sources/i_user_data_source.dart';
import 'package:code_base/features/user/data/data_sources/user_data_source.dart';
import 'package:code_base/features/user/data/repositories/user_repository.dart';
import 'package:code_base/features/user/domain/repositories/i_user_repository.dart';
import 'package:code_base/features/user/domain/use_cases/user_list_usecase.dart';
import 'package:code_base/features/user/presentation/manager/user_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'di.dart';
