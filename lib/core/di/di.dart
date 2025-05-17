part of '../../../../core/di/di_import_path.dart';

final injector = GetIt.instance;

Future<void> injectDependencies() async {
  ///==========================================================================
  ///================================== CORE ==================================
  ///==========================================================================
  injector.registerLazySingleton<Dio>(() {
    Dio dio = Dio(BaseOptions(
      connectTimeout: AppConstants.apiTimeOut,
      receiveTimeout: AppConstants.apiTimeOut,
      sendTimeout: AppConstants.apiTimeOut,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers[contentType] = applicationJson;
        options.headers[accept] = applicationJson;
        handler.next(options);
      },
    ));

    return dio;
  });
}
