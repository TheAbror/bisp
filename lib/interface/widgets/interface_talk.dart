import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TalkWidget extends StatefulWidget {
  const TalkWidget({super.key});

  @override
  State<TalkWidget> createState() => _TalkWidgetState();
}

class _TalkWidgetState extends State<TalkWidget> {
  // AudioCache player = AudioCache(prefix: 'audios/');

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 65.h,
      right: 30.w,
      child: GestureDetector(
        onTap: () async {
          // setState(() {
          // await player.setSource(AssetSource('assets/audios/why mona - Wannabe 1 19 3.mp3'));
          // player.play(source);
          // await player.play('mona.mp3');
          //TODO
          // });
        },
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 111, 150, 208),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 3.w)),
          child: Center(
              child: Text(
            'TALK',
            style: TextStyle(
              fontSize: 30.sp,
              color: Colors.white,
            ),
          )),
        ),
      ),
    );
  }
}
