import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants/values/app_colors.dart';

class MyProfileSubjectPercentage extends StatelessWidget {
  const MyProfileSubjectPercentage({
    Key? key,
    required this.percentage,
    required this.subject,
  }) : super(key: key);

  final double percentage;
  final String subject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          subject,
          style: TextStyle(fontSize: 22.sp),
        ),
        const Spacer(),
        LinearPercentIndicator(
          width: 84.w,
          lineHeight: 30.h,
          percent: percentage,
          backgroundColor: AppColors.taskbarBackground,
          progressColor: AppColors.taskDoneColor,
          barRadius: const Radius.circular(32),
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 1,
          ),
          center: Text(
            "${(percentage * 100).round()}%",
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
