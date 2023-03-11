import 'package:bonfire/bonfire.dart';
import 'package:eduninjav2/core/auth/auth_view.dart';
import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/core/utils/api_logging.dart';
import 'package:eduninjav2/game/player/sprite_sheet_hero.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double tileSize = 24;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// For logging
  setUpLogging();

  await SpriteSheetHero.load();
  if (!kIsWeb) {
    await Flame.device.setPortrait();
    await Flame.device.fullScreen();
  }
  //TODO add multiblocprovider
  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const AuthPage(),
          theme: ThemeData(
            fontFamily: 'Mali',
            primaryColor: AppColors.primaryColor,
            brightness: Brightness.light,
            backgroundColor: AppColors.taskbarBackground,
            dividerColor: Colors.white54,
          ),
        );
      }),
    ),
  );
}
