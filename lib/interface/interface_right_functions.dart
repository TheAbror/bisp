import 'package:eduninjav2/constants/values/global_constants.dart';
import 'package:eduninjav2/watch/watch_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/values/topRight_functions.dart';
import '../pages/subjects/all_subjects.dart';
import 'interface_overlay.dart';

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
                  context: context,
                  builder: (BuildContext context) {
                    // return const CompletetdPage();
                    return const Tasks();
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

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int taskCount = 1;
  PageController _pageController = PageController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 50.h),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 18.h),
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primaryColor, width: 1.w),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Text(
                            GlobalConstants.introMessages[taskCount].toString(),
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap:
                                    _controller.hasClients ? _previous : null,
                                child: Row(
                                  children: const [
                                    Icon(Icons.navigate_before),
                                    Text('Previous')
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: _controller.hasClients ? _next : null,
                                child: Row(
                                  children: const [
                                    Text('Next'),
                                    Icon(Icons.navigate_next),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10.w,
                top: 25.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primaryColor, width: 1.w),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Mrs.Green',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _next() {
    if (taskCount < GlobalConstants.introMessages.length - 1) {
      _pageController.animateToPage(
        taskCount + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    }
  }

  void _previous() {
    if (taskCount > 0) {
      _pageController.animateToPage(
        taskCount - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    }
  }
}
