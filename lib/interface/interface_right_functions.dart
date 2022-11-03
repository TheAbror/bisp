import 'package:eduninjav2/completed/completed.dart';
import 'package:eduninjav2/watch/watch_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/values/topRight_functions.dart';
import '../pages/subjects/all_subjects.dart';

// ignore: camel_case_types
class RightMenuItems extends StatelessWidget {
  const RightMenuItems({super.key});

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
          TopRightFunctions(
              icon: Icons.group,
              onTap: () {
                showDialog(
                  barrierColor: Colors.grey.shade200.withOpacity(0.8),
                  context: context,
                  builder: (BuildContext context) {
                    return const CompletetdPage();
                  },
                );
              }),
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
