import 'dart:convert';

import 'package:code_base/core/utility/constants/string_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultValue.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeOut.getFailure();
    case DioExceptionType.badResponse:
      return DataSource.badRequest.getFailure();
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    default:
      return DataSource.defaultValue.getFailure();
  }
}

enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  defaultValue
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.noContent:
        return Failure(
            code: ResponseCode.notContent,
            status: ResponseMessage.noContent,
            message: '');
      case DataSource.badRequest:
        return Failure(
            code: ResponseCode.badRequest,
            status: ResponseMessage.badRequest,
            message: '');
      case DataSource.forbidden:
        return Failure(
            code: ResponseCode.forbidden,
            status: ResponseMessage.forbidden,
            message: '');
      case DataSource.unauthorized:
        return Failure(
            code: ResponseCode.unAuthorized,
            status: ResponseMessage.unAuthorized,
            message: '');
      case DataSource.notFound:
        return Failure(
            code: ResponseCode.notFound,
            status: ResponseMessage.notFound,
            message: '');
      case DataSource.internalServerError:
        return Failure(
            code: ResponseCode.internalServerError,
            status: ResponseMessage.internalServerError,
            message: '');
      case DataSource.connectTimeOut:
        return Failure(
            code: ResponseCode.connectTimeOut,
            status: ResponseMessage.connectTimeOut,
            message: '');
      case DataSource.cancel:
        return Failure(
            code: ResponseCode.cancel,
            status: ResponseMessage.cancel,
            message: '');
      case DataSource.receiveTimeOut:
        return Failure(
            code: ResponseCode.receiveTimeOut,
            status: ResponseMessage.receiveTimeOut,
            message: '');
      case DataSource.sendTimeOut:
        return Failure(
            code: ResponseCode.sendTimeOut,
            status: ResponseMessage.sendTimeOut,
            message: '');
      case DataSource.cacheError:
        return Failure(
            code: ResponseCode.cacheError,
            status: ResponseMessage.cacheError,
            message: '');
      case DataSource.noInternetConnection:
        return Failure(
            code: ResponseCode.noInternetConnection,
            status: ResponseMessage.noInternetConnection,
            message: '');
      case DataSource.defaultValue:
        return Failure(
            code: ResponseCode.defaultValue,
            status: ResponseMessage.defaultValue,
            message: '');
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int notContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found

  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultValue = -8;
}

class ResponseMessage {
  static const String success = StringManager.success;
  static const String noContent = StringManager.success;
  static const String badRequest = StringManager.strBadRequestError;
  static const String unAuthorized = StringManager.strUnauthorizedError;
  static const String forbidden = StringManager.strForbiddenError;
  static const String internalServerError =
      StringManager.strInternalServerError;
  static const String notFound = StringManager.strNotFoundError;

  static const String connectTimeOut = StringManager.strTimeoutError;
  static const String cancel = StringManager.strDefaultError;
  static const String receiveTimeOut = StringManager.strTimeoutError;
  static const String sendTimeOut = StringManager.strTimeoutError;
  static const String cacheError = StringManager.strCacheError;
  static const String noInternetConnection = StringManager.strNoInternetError;
  static const String defaultValue = StringManager.strDefaultError;
}

