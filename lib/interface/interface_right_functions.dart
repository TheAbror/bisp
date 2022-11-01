import 'package:eduninjav2/watch/watch_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/values/topRight_functions.dart';
import '../pages/subjects/all_subjects.dart';

// ignore: camel_case_types
class rightMenuItems extends StatelessWidget {
  const rightMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          TopRightFunctions(
            icon: Icons.play_arrow,
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WatchPage()),
              );
            }),
          ),
          SizedBox(width: 6.w),
          TopRightFunctions(icon: Icons.group, onTap: () {}),
          SizedBox(width: 6.w),
          TopRightFunctions(
            icon: Icons.list,
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AllSubjects()),
              );
            }),
          ),
        ],
      ),
    );
  }
}
