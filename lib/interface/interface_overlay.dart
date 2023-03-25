import 'package:bonfire/util/game_controller.dart';
import 'package:eduninjav2/interface/interface_chat.dart';
import 'package:flutter/material.dart';

import 'widgets/interface_talk.dart';
import 'views/interface_top_functions.dart';

class InterfaceOverlay extends StatefulWidget {
  final GameController gameController;

  const InterfaceOverlay({super.key, required this.gameController});

  @override
  State<InterfaceOverlay> createState() => _InterfaceOverlayState();
}

class _InterfaceOverlayState extends State<InterfaceOverlay> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Container(height: double.infinity),
          const InterfaceTopFunctions(),
          const TalkWidget(),
          const ChatWidget(),
        ],
      ),
    );
  }
}
