import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250.h,
            width: 250.w,
            child: const RiveAnimation.asset('assets/gifs/no-internet.riv'),
          ),
          Text(
            'No Internet Connection',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
