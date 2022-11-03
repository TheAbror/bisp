import 'package:eduninjav2/my_profile/my_profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_class.dart';
import 'my_profile_class.dart';
import 'my_profile_main.dart';

enum MyProfileItems { profile, classs, edit }

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  MyProfileItems item = MyProfileItems.profile;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.cyan[800],
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: EdgeInsets.only(top: 5.h),
          height: 455.h,
          width: 300.w,
          child: Column(
            children: [
              // my profile -my class - x
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        MyProfileClass(
                          icon: Icons.account_box,
                          text: 'My Profile',
                          onTap: () {
                            setState(() {
                              item = MyProfileItems.profile;
                            });
                          },
                        ),
                        MyProfileClass(
                          icon: Icons.groups,
                          text: 'My Class',
                          onTap: () {
                            setState(() {
                              item = MyProfileItems.classs;
                            });
                          },
                        ),
                        MyProfileClass(
                          icon: Icons.groups,
                          text: 'Edit',
                          onTap: () {
                            setState(() {
                              item = MyProfileItems.edit;
                            });
                          },
                        ),
                        const Spacer(flex: 2),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            // margin: EdgeInsets.only(right: 5.w),
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
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 6, right: 6, top: 1, bottom: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.w, horizontal: 8.h),
                    child: SingleChildScrollView(
                      child: item == MyProfileItems.profile
                          ? const MyProfileSubjectMain()
                          : const MyProfileEdit(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget getSelectedContent() {
  //   switch (item) {
  //     case MyProfileItems.profile:
  //       return MyProfileSubjectMain();
  //     case MyProfileItems.profile:
  //       return MyClass();
  //     case MyProfileItems.edit:
  //       return MyProfileEdit();
  //     case MyProfileItems.classs:

  //   }
  // }
}
