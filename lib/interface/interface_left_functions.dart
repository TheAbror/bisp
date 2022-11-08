import 'package:eduninjav2/interface/interface_linear_bar.dart';
import 'package:eduninjav2/interface/interface_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'interface_tasks_class.dart';

bool open = false;
bool loading = true;
String statusServer = "CONNECTING";

final List<Tasks> task = <Tasks>[
  Tasks(
      task: 'Find History teacher cvb cvb cvb cvb cvb vbnvbn vbnvbnv hihihi',
      taskDone: true),
  Tasks(task: 'Task2 xcv xcvbc xcvxcvcx xcvcxvxc xcvcxv', taskDone: true),
  Tasks(task: 'Task3', taskDone: false),
  Tasks(task: 'Task4 fgfkj df fgf dfgdf ', taskDone: true),
  Tasks(task: 'Task5', taskDone: true),
  Tasks(task: 'Task6', taskDone: false),
  Tasks(task: 'Task7', taskDone: false),
  Tasks(task: 'Task8', taskDone: true),
  Tasks(task: 'Task9', taskDone: false),
  Tasks(task: 'Task10', taskDone: true),
  Tasks(task: 'Task11', taskDone: true),
];

class LeftMenuItems extends StatefulWidget {
  const LeftMenuItems({super.key});

  @override
  State<LeftMenuItems> createState() => _LeftMenuItemsState();
}

class _LeftMenuItemsState extends State<LeftMenuItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const LinearProgressBar(
                percentage: 0.4,
              ),
              SizedBox(width: 5.w),
              GestureDetector(
                onTap: () {
                  open = !open;
                  setState(() {});
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAE2DC),
                      border: Border.all(color: primaryColor, width: 2.w),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      child: const Icon(Icons.expand_more),
                    )),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Opacity(
            opacity: open ? 1.0 : 0,
            child: Container(
              height: 200.h,
              width: 110.w,
              decoration: BoxDecoration(
                  color: const Color(0xFFEAE2DC),
                  border: Border.all(color: primaryColor, width: 1.w),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.h),
                    child: Text('Tasks',
                        style: TextStyle(fontSize: 22.sp, color: primaryColor)),
                  ),
                  SizedBox(
                    height: 155.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //icon
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.h),
                              child: Icon(
                                task[index].taskDone == false
                                    ? Icons.check_box_outline_blank
                                    : Icons.check_box,
                                color: taskDoneColor,
                              ),
                            ),
                            SizedBox(
                              height: 55.h,
                              width: 90.w,
                              child: Text(
                                task[index].task,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                style: const TextStyle(color: primaryColor),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: task.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          if (loading)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  statusServer,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
