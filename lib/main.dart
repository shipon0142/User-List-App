import 'package:code_base/config/routes/app_router.dart';
import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/core/utility/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorManager.kColorWhite,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Profile Book',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: ColorManager.kColorWhite,
        dialogBackgroundColor: ColorManager.kColorWhite,
        canvasColor: ColorManager.kColorWhite,
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: ColorManager.kColorWhite,
            modalBackgroundColor: ColorManager.kColorWhite),
        colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.kColorWhite),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
