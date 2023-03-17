import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/core/constants/values/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommandTasks extends StatefulWidget {
  const CommandTasks({super.key});

  @override
  State<CommandTasks> createState() => _CommandTasksState();
}

String username = '';

class _CommandTasksState extends State<CommandTasks> {
  int taskCount = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? '');
    });
  }

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
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 50.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 18.h),
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.primaryColor, width: 1.w),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              GlobalConstants.introMessages[taskCount]['text'].toString(),
                              style: TextStyle(fontSize: 22.sp),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: _previous,
                                child: Row(
                                  children: const [Icon(Icons.navigate_before), Text('Previous')],
                                ),
                              ),
                              taskCount == GlobalConstants.introMessages.length - 1
                                  ? GestureDetector(onTap: (() => Navigator.pop(context)), child: const Text('Start'))
                                  : GestureDetector(
                                      onTap: _next,
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
                child: TalkingPerson(
                  text: username,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _next() {
    setState(() {
      taskCount++;
    });
  }

  void _previous() {
    setState(() {
      taskCount--;
    });
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
        border: Border.all(color: AppColors.primaryColor, width: 1.w),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18.sp),
      ),
    );
  }
}
