import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(
            child: RiveAnimation.asset('assets/gifs/server-error.riv'),
          ),
        ],
      ),
    );
  }
}
