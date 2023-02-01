import 'package:eduninjav2/interface/views/left_functions/interface_left_functions.dart';
import 'package:eduninjav2/watch/command_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'right_functions/interface_right_functions.dart';

class InterfaceTopFunctions extends StatefulWidget {
  const InterfaceTopFunctions({Key? key}) : super(key: key);

  @override
  State<InterfaceTopFunctions> createState() => _InterfaceTopFunctionsState();
}

class _InterfaceTopFunctionsState extends State<InterfaceTopFunctions> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CommandTasks();
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          LeftMenuItems(),
          Spacer(),
          RightMenuItems(),
        ],
      ),
    );
  }
}
