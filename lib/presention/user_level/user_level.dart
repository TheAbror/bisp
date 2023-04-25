import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/core/shared_preferences/preferences_services.dart';
import 'package:eduninjav2/presention/user_level/bloc/user_level_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class UserLevel extends StatelessWidget {
  UserLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: BlocBuilder<UserLevelBloc, UserLevelState>(
          builder: (context, state) {
            return Container(
              height: 330.h,
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
                    flex: 5,
                    child: Column(
                      children: [
                        Text(
                          'Your Level: ${state.level.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<UserLevelBloc>().updateUserLevel();
                            _saveData();
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

  final _preferencesService = PreferencesServices();

  void _saveData() {
    final userData = UserDetails(
      userLevel: 1.00,
    );

    _preferencesService.saveUserData(userData);
  }
}
