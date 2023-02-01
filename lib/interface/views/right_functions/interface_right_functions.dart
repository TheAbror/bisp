import 'package:eduninjav2/watch/command_tasks.dart';
import 'package:eduninjav2/watch/watch_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/values/topRight_functions.dart';
import '../../../pages/subjects/all_subjects.dart';

class RightMenuItems extends StatefulWidget {
  const RightMenuItems({super.key});

  @override
  State<RightMenuItems> createState() => _RightMenuItemsState();
}

class _RightMenuItemsState extends State<RightMenuItems> {
  @override
  void initState() {
    const CommandTasks();
    super.initState();
  }

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
                  context: context,
                  builder: (BuildContext context) {
                    return const CommandTasks();
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
