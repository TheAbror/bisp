import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../core/constants/values/app_colors.dart';
import 'view/my_profile_percentage.dart';

enum MyProfileItems { profile, classs, edit }

class MyProfileSubjectMain extends StatefulWidget {
  const MyProfileSubjectMain({
    Key? key,
  }) : super(key: key);

  @override
  State<MyProfileSubjectMain> createState() => _MyProfileSubjectMainState();
}

class _MyProfileSubjectMainState extends State<MyProfileSubjectMain> {
  File? file;
  ImagePicker image = ImagePicker();
  MyProfileItems item = MyProfileItems.profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                file == null
                    ? const CircleAvatar(radius: 40, child: Icon(Icons.image))
                    : Container(
                        height: 100.h,
                        width: 100.h,
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
              children: const [
                Text('Christie'),
                Text('Smith'),
                Text('00001234'),
                Text('01.02.2003'),
                Text('Black Dragons'),
                Text('abcdefj@gmail.com'),
              ],
            ),
            //overall performance
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Coming Level 5'),
                SizedBox(height: 5.h),
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
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  item = MyProfileItems.edit;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Edit'),
                    Icon(Icons.edit, size: 18),
                  ],
                ),
              ),
            ),
          ],
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
              subject: 'Chemistry',
              percentage: 0.25,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Civil War',
              percentage: 0.35,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Math',
              percentage: 0.7,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Geography',
              percentage: 0.95,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Us History',
              percentage: 0.59,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Chemistry',
              percentage: 0.88,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Chemistry',
              percentage: 0.35,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Chemistry',
              percentage: 0.97,
            ),
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
