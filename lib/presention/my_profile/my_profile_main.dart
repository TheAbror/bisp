import 'dart:io';
import 'package:eduninjav2/interface/widgets/interface_linear_bar.dart';
import 'package:eduninjav2/presention/my_profile/my_class_achievement.dart';
import 'package:eduninjav2/presention/user_level/bloc/user_level_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/values/app_colors.dart';

enum MyProfileItems { profile, classs, edit }

class MyProfileSubjectMain extends StatefulWidget {
  const MyProfileSubjectMain({
    Key? key,
  }) : super(key: key);

  @override
  State<MyProfileSubjectMain> createState() => _MyProfileSubjectMainState();
}

String username = '';
double level = 1;

class _MyProfileSubjectMainState extends State<MyProfileSubjectMain> {
  File? file;
  ImagePicker image = ImagePicker();
  MyProfileItems item = MyProfileItems.profile;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? '');
      level = (prefs.getDouble('level') ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<UserLevelBloc, UserLevelState>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    file == null
                        ? const CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.settingsTopColor,
                            child: Icon(
                              Icons.image,
                              color: Colors.white,
                            ))
                        : Container(
                            height: 110.h,
                            width: 110.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(file!, fit: BoxFit.fill),
                            ),
                          ),
                    GestureDetector(
                      onTap: (() => getgall()),
                      child: const Text(
                        'Set Avatar',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('First Name:'),
                    Text('Last Name:'),
                    Text('Student ID:'),
                    Text('Date of Birth:'),
                    Text('Group:'),
                    Text('Email:'),
                  ],
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username),
                    const Text('Shamuradov'),
                    const Text('00009647'),
                    const Text('25.10.2001'),
                    const Text('Black Dragons'),
                    const Text('oyjddkvj@gmail.com'),
                  ],
                ),
                //overall performance
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Current Level ${state.level.toStringAsFixed(2)}'),
                    SizedBox(height: 5.h),
                    if (state.level <= 2.0) LinearProgressBarChild(percentage: state.level - 1),
                    if (state.level >= 2.0) LinearProgressBarChild(percentage: state.level - 2),
                    if (state.level >= 3.0) LinearProgressBarChild(percentage: state.level - 3),
                  ],
                ),
              ],
            );
          },
        ),
        SizedBox(height: 10.h),
        const Divider(
          height: 2,
          color: Colors.black,
        ),
        SizedBox(height: 10.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyProfileSubjectPercentage(
              subject: 'Biology',
              percentage: 0.15,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Geometry',
              percentage: 0.72,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'US History',
              percentage: 0.47,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Programming',
              percentage: 0.95,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ],
    );
  }

  getgall() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
