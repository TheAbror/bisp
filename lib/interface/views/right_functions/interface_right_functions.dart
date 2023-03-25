import 'package:eduninjav2/core/api/api_provider.dart';
import 'package:eduninjav2/presention/subjects/all_subjects_settings.dart';
import 'package:eduninjav2/presention/subjects/watch/command_tasks.dart';
import 'package:eduninjav2/presention/subjects/watch/watch_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/values/topRight_functions.dart';
import '../../../presention/subjects/all_subjects.dart';

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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WatchPage()),
              );
            },
          ),
          SizedBox(width: 6.w),
          TopRightFunctions(
            icon: Icons.settings,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SubjectSettings();
                },
              );
            },
          ),
          SizedBox(width: 6.w),
          TopRightFunctions(
            icon: Icons.list,
            onTap: () {
              ApiProvider.create();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AllSubjects()),
              );
            },
          ),
        ],
      ),
    );
  }
}
