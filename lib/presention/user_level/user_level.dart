import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/presention/user_level/bloc/user_level_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

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
              height: 350.h,
              width: 100.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 5.h),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Row(
                        children: [
                          const Spacer(flex: 2),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.white),
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
                        Text(
                          'Your Level: ${state.level.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<UserLevelBloc>().updateUserLevel();
                          },
                          child: SizedBox(
                            height: 220.h,
                            width: 150.w,
                            child: const RiveAnimation.asset('assets/gifs/flutter_bird.riv'),
                          ),
                        ),
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
