import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/presention/user_level/bloc/user_level_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UserLevel extends StatelessWidget {
  const UserLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: BlocBuilder<UserLevelBloc, UserLevelState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 5.h),
              height: 200.h,
              width: 100.w,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        children: [
                          const Spacer(),
                          const Text(
                            'Current Level',
                            style: TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        LinearPercentIndicator(
                          width: 84.w,
                          lineHeight: 30.h,
                          percent: 0.9,
                          backgroundColor: AppColors.taskbarBackground,
                          progressColor: AppColors.taskDoneColor,
                          barRadius: const Radius.circular(32),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 1,
                          ),
                          center: Text(
                            "${(0.7 * 100).round()}%",
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Text('data')
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
