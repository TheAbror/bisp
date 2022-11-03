import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfileEdit extends StatefulWidget {
  const MyProfileEdit({super.key});

  @override
  State<MyProfileEdit> createState() => _MyProfileEditState();
}

class _MyProfileEditState extends State<MyProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red.shade900, width: 1.w),
                    borderRadius: BorderRadius.circular(100)),
                child: const CircleAvatar(radius: 100),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.red.shade900),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'Change profile photo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                SizedBox(
                  width: 100.w,
                  height: 50.h,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 100.w,
                  height: 50.h,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 100.w,
                  height: 50.h,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date of Birth',
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 100.w,
                  height: 50.h,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.red.shade900),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
