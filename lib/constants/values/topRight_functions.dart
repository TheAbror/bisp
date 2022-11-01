// ignore_for_file: file_names

import 'package:eduninjav2/interface/interface_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRightFunctions extends StatelessWidget {
  const TopRightFunctions({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        decoration: decorationTopLeft(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
          child: Icon(icon, color: const Color(0xFFEAE2DC)),
        ),
      ),
    );
  }
}

BoxDecoration decorationTopLeft() {
  return BoxDecoration(
    color: const Color.fromARGB(255, 188, 120, 68),
    border: Border.all(color: primaryColor, width: 5),
    borderRadius: BorderRadius.circular(10),
  );
}
