import 'package:eduninjav2/constants/values/global_constants.dart';
import 'package:eduninjav2/interface/interface_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommandTasks extends StatefulWidget {
  const CommandTasks({super.key});

  @override
  State<CommandTasks> createState() => _CommandTasksState();
}

class _CommandTasksState extends State<CommandTasks> {
  int taskCount = 1;
  // ignore: prefer_final_fields
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
                            GlobalConstants.introMessages[0]['text'].toString(),
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
                child: const TalkingPerson(
                  text: 'Mrs.Greens',
                ),
              ),
              Positioned(
                right: 15.w,
                top: 25.h,
                child: const TalkingPerson(
                  text: 'You',
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

class TalkingPerson extends StatelessWidget {
  const TalkingPerson({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor, width: 1.w),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18.sp),
      ),
    );
  }
}
