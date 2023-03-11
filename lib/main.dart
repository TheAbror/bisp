import 'package:bonfire/bonfire.dart';
import 'package:eduninjav2/core/auth/auth_view.dart';
import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/core/utils/api_logging.dart';
import 'package:eduninjav2/presention/cms/bloc/cms_bloc.dart';
import 'package:eduninjav2/presention/player/sprite_sheet_hero.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CmsBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Mali',
            primaryColor: AppColors.primaryColor,
            brightness: Brightness.light,
            backgroundColor: AppColors.taskbarBackground,
            dividerColor: Colors.white54,
          ),
          home: const AuthPage(),
        );
      }),
    );
  }
}
