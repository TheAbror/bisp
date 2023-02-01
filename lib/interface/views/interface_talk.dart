import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TalkWidget extends StatefulWidget {
  const TalkWidget({super.key});

  @override
  State<TalkWidget> createState() => _TalkWidgetState();
}

class _TalkWidgetState extends State<TalkWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 65.h,
      right: 21.w,
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
    );
  }
}
