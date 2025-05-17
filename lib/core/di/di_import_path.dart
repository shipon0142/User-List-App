import 'package:assignment/core/network/api_config.dart';
import 'package:assignment/core/network/network_info.dart';
import 'package:assignment/core/utility/constants/constants_manager.dart';
import 'package:assignment/features/user/data/api_service/user_api_service.dart';
import 'package:assignment/features/user/data/data_sources/i_user_data_source.dart';
import 'package:assignment/features/user/data/data_sources/user_data_source.dart';
import 'package:assignment/features/user/data/repositories/user_repository.dart';
import 'package:assignment/features/user/domain/repositories/i_user_repository.dart';
import 'package:assignment/features/user/domain/use_cases/user_list_usecase.dart';
import 'package:assignment/features/user/presentation/manager/user_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'di.dart';
