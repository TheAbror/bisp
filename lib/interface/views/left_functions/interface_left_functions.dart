import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/interface/widgets/interface_linear_bar.dart';
import 'package:eduninjav2/interface/widgets/interface_tasks_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool open = false;
bool loading = true;
String statusServer = "CONNECTING";

final List<Tasks> task = <Tasks>[
  Tasks(task: 'Learn about Biology concepts', taskDone: true),
  Tasks(task: 'Learn about Biology History', taskDone: false),
  Tasks(task: 'Study about Civil War', taskDone: false),
  Tasks(task: 'Study about Chemical basis', taskDone: false),
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
              const LinearProgressBar(percentage: 0.0),
              SizedBox(width: 5.w),
              GestureDetector(
                onTap: () {
                  open = !open;
                  setState(() {});
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAE2DC),
                      border: Border.all(color: AppColors.primaryColor, width: 2.w),
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
                  border: Border.all(color: AppColors.primaryColor, width: 1.w),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.h),
                    child: Text('Tasks', style: TextStyle(fontSize: 22.sp, color: AppColors.primaryColor)),
                  ),
                  SizedBox(
                    height: 155.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.h),
                              child: Icon(
                                task[index].taskDone == false ? Icons.check_box_outline_blank : Icons.check_box,
                                color: AppColors.taskDoneColor,
                              ),
                            ),
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                task[index].task,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                style: const TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                            SizedBox(height: 5.h)
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
          // if (loading)
          //   Align(
          //     alignment: Alignment.bottomLeft,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text(
          //         statusServer,
          //         style: const TextStyle(fontSize: 12, color: Colors.white),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
