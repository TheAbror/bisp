import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../core/constants/values/app_colors.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 84.w,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primaryColor,
      ),
      // child: const Center(child: Text('Processing...')),
      child: LinearPercentIndicator(
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
    );
  }
}
