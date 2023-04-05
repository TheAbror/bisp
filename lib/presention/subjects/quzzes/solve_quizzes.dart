import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SolveQuizzes extends StatefulWidget {
  const SolveQuizzes({super.key});

  @override
  State<SolveQuizzes> createState() => _SolveQuizzesState();
}

class _SolveQuizzesState extends State<SolveQuizzes> {
  int count = 0;

  void showToast() {
    Fluttertoast.showToast(
      msg: "Required level is ${count + 1}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14.sp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.primaryColor, width: 2.w),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Fill in the gaps',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: 40.h),
                          Text(
                            '1. Protist, fungi, plants,and animals are _________ organisms.',
                            style: TextStyle(fontSize: 28.sp),
                          ),
                          SizedBox(height: 20.h),
                          //TODO Eukoryotic
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            child: const TextField(),
                          ),
                          SizedBox(height: 20.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(300, 50.h), backgroundColor: Colors.red.shade900),
                            onPressed: () {
                              showToast();
                            },
                            child: const Text('Check Results'),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Positioned(
              right: 7.w,
              top: 10.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(color: Colors.red.shade900, borderRadius: BorderRadius.circular(50)),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
