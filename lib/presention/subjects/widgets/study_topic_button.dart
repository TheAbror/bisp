import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyTopicButton extends StatelessWidget {
  const StudyTopicButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.w,
      width: 130.h,
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(color: AppColors.primaryColor, width: 3.h),
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Center(
        child: Text(
          'Study Topic',
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}

BoxDecoration boxDesign2() {
  return BoxDecoration(
    border: Border.all(color: AppColors.primaryColor, width: 1.h),
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration boxDesign() {
  return BoxDecoration(
    color: const Color.fromARGB(255, 225, 166, 71),
    border: Border.all(color: AppColors.primaryColor, width: 5.h),
    borderRadius: BorderRadius.circular(10),
  );
}
