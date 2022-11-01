import 'package:bonfire/bonfire.dart';
import 'package:eduninjav2/constants/values/app_colors.dart';
import 'package:eduninjav2/game/player/sprite_sheet_hero.dart';
import 'package:eduninjav2/pages/select_hero_.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double tileSize = 24;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpriteSheetHero.load();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SelectHero(),
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
