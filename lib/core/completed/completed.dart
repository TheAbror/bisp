import 'package:eduninjav2/core/constants/values/topRight_functions.dart';
import 'package:eduninjav2/core/string_constants.dart/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletetdPage extends StatefulWidget {
  const CompletetdPage({super.key});

  @override
  State<CompletetdPage> createState() => _CompletetdPageState();
}

class _CompletetdPageState extends State<CompletetdPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30.h),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          height: 245.h,
          width: 170.w,
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(color: AppStrings.primaryColor, width: 2.w),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Positioned(
                top: 5.h,
                child: Text(
                  'complete'.toUpperCase(),
                  style: TextStyle(fontSize: 40.sp, color: Colors.red.shade900, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 60.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                  decoration: BoxDecorationForCompleted(),
                  child: const Text(
                    'level 2',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ),
              Positioned(
                top: 90.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 55,
                      color: Colors.red.shade900,
                    ),
                    Icon(
                      Icons.star,
                      size: 55,
                      color: Colors.red.shade900,
                    ),
                    Icon(
                      Icons.star_half,
                      size: 55,
                      color: Colors.red.shade900,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 170.h,
                child: Container(
                  height: 45.h,
                  width: 70.w,
                  margin: EdgeInsets.only(bottom: 5.h),
                  decoration: BoxDecorationForCompleted(),
                  // alignment: AlignmentDirectional.centerStart,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red.shade900),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.circle,
                          color: Colors.amber,
                        ),
                      ),
                      const Text(
                        'NEW POINTS: 28',
                        style: TextStyle(color: Colors.amber),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopRightFunctions(icon: Icons.play_arrow, onTap: () {}),
            SizedBox(width: 10.w),
            TopRightFunctions(icon: Icons.replay, onTap: () {}),
            SizedBox(width: 10.w),
            TopRightFunctions(icon: Icons.share, onTap: () {}),
          ],
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  BoxDecoration BoxDecorationForCompleted() {
    return BoxDecoration(
      color: Colors.red.shade900,
      border: Border.all(color: Colors.amber.shade900, width: 1.w),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
