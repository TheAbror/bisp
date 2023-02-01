import 'package:eduninjav2/core/constants/values/topRight_functions.dart';
import 'package:eduninjav2/core/string_constants.dart/app_strings.dart';
import 'package:eduninjav2/pages/subjects/all_subjects_settings.dart';
import 'package:eduninjav2/pages/subjects/all_subjects_specific_subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/values/custom_dropdownbutton.dart';

class AllSubjects extends StatefulWidget {
  const AllSubjects({super.key});

  @override
  State<AllSubjects> createState() => _AllSubjectsState();
}

class _AllSubjectsState extends State<AllSubjects> {
  String? selectedSubject;

  List<String> subjects = ['US Hitory', 'Geography', 'Maths', 'Chemistry', 'Biology and its lorem ipsum'];

  String? selectedGrade;

  List<String> grades = [
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
    'Grade 5',
    'Grade 6',
    'Grade 7',
    'Grade 8',
    'Grade 9',
    'Grade 10',
  ];

  bool music = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellow.shade900,
              Colors.yellow.shade800,
              Colors.yellow.shade800,
              Colors.yellow.shade600,
              Colors.green.shade400,
              Colors.green.shade500,
              Colors.green.shade600,
            ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          right: false,
          left: false,
          child: Stack(
            children: [
              //name and level
              Positioned(
                top: 5.w,
                left: 42,
                child: Container(
                  width: 180.h,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 166, 71),
                    border: Border.all(color: AppStrings.primaryColor, width: 5.h),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 8.h),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('CH'),
                        ),
                      ),
                      Column(
                        children: const [
                          Text('Christie'),
                          Text('Level 1'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //main part - subjects
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    SizedBox(width: 42),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 20),
                    AllSubjectSpecificSubject(),
                    SizedBox(width: 42),
                  ],
                ),
              ),
              //list of subjects to choose
              Positioned(
                left: 280.h,
                top: 5.w,
                child: Container(
                  height: 20.w,
                  width: 155.h,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 166, 71),
                    border: Border.all(color: AppStrings.primaryColor, width: 5.h),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomDropdownButton(
                    hint: 'All Subjects',
                    dropdownItems: subjects,
                    dropdownElevation: 2,
                    selectedValue: selectedSubject,
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                  ),
                ),
              ),
              //grade
              Positioned(
                left: 460.h,
                top: 5.w,
                child: Container(
                  height: 20.w,
                  width: 140.h,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 166, 71),
                    border: Border.all(color: AppStrings.primaryColor, width: 5.h),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomDropdownButton(
                    hint: 'Grade',
                    dropdownItems: grades,
                    dropdownElevation: 2,
                    selectedValue: selectedGrade,
                    onChanged: (value) {
                      setState(() {
                        selectedGrade = value;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                right: 30.h,
                top: 5.w,
                child: Row(
                  children: [
                    TopRightFunctions(
                      icon: music ? Icons.mic : Icons.mic_off,
                      onTap: () {
                        setState(() {
                          music = !music;
                        });
                      },
                    ),
                    SizedBox(width: 20.h),
                    TopRightFunctions(
                        icon: Icons.settings,
                        onTap: () {
                          showDialog(
                            barrierColor: Colors.grey.shade200.withOpacity(0.8),
                            context: context,
                            builder: (BuildContext context) {
                              return const SubjectSettings();
                            },
                          );
                        }),
                    SizedBox(width: 20.h),
                    TopRightFunctions(icon: Icons.priority_high, onTap: () {}),
                    SizedBox(width: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
