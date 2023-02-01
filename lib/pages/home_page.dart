import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:eduninjav2/game/player/local/local_player.dart';
import 'package:eduninjav2/game/player/sprite_sheet_hero.dart';
import 'package:flutter/material.dart';
import '../interface/interface_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GameController _controller = GameController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var tileSize = max(constraints.maxHeight, constraints.maxWidth) / 30;
        return BonfireWidget(
          joystick: Joystick(directional: JoystickDirectional()),
          map: WorldMapByTiled('tile/school_campus_main.json',
              forceTileSize: Vector2(tileSize, tileSize), tileSizeToUpdate: tileSize),
          player: LocalPlayer(1, 'KMDev', Vector2(75 * tileSize, 25 * tileSize), _getSprite(6)),
          initialActiveOverlays: const ['barLife'],
          overlayBuilderMap: {
            'barLife': (_, game) => InterfaceOverlay(gameController: _controller),
          },
        );
      },
    );
  }

  SpriteSheet _getSprite(int index) {
    switch (index) {
      case 0:
        return SpriteSheetHero.hero1;
      case 1:
        return SpriteSheetHero.hero2;
      case 2:
        return SpriteSheetHero.hero3;
      case 3:
        return SpriteSheetHero.hero4;
      case 4:
        return SpriteSheetHero.hero5;
      case 5:
        return SpriteSheetHero.hero6;
      case 6:
        return SpriteSheetHero.hero7;
      default:
        return SpriteSheetHero.hero2;
    }
  }
}
