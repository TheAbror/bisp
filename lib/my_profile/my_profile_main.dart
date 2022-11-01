import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_profile_subject_percentage.dart';

class MyProfileSubjectMain extends StatefulWidget {
  const MyProfileSubjectMain({
    Key? key,
  }) : super(key: key);

  @override
  State<MyProfileSubjectMain> createState() => _MyProfileSubjectMainState();
}

class _MyProfileSubjectMainState extends State<MyProfileSubjectMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 40,
              child: Text('CS'),
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
              ],
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
              percentage: 0.45,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Chemistry',
              percentage: 0.55,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Chemistry',
              percentage: 0.65,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Chemistry',
              percentage: 0.75,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Chemistry',
              percentage: 0.85,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Chemistry',
              percentage: 0.95,
            ),
            SizedBox(height: 10.h),
            const MyProfileSubjectPercentage(
              subject: 'Chemistry',
              percentage: 0.96,
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
}
