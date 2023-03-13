import 'package:eduninjav2/core/constants/bloc_progress.dart';
import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/core/constants/values/custom_dropdownbutton.dart';
import 'package:eduninjav2/core/constants/values/topRight_functions.dart';
import 'package:eduninjav2/presention/cms/bloc/cms_bloc.dart';
import 'package:eduninjav2/presention/subjects/all_subjects_settings.dart';
import 'package:eduninjav2/presention/subjects/all_subjects_specific_subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        decoration: lessonsDecoration(),
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
                    border: Border.all(color: AppColors.primaryColor, width: 5.h),
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

              BlocBuilder<CmsBloc, CmsState>(
                builder: (context, state) {
                  if (state.blocProgress == BlocProgress.IS_LOADING) {
                    return const Center(child: CircularProgressIndicator(color: Colors.white));
                  }
                  if (state.cms.isEmpty) {
                    return const Center(child: Text('No Materials available'));
                  }

                  final modulesList = state.cms.where((element) => element.module.toLowerCase() == 'geometry');

                  if (modulesList.isNotEmpty) {
                    final module = modulesList.first;

                    final lessons = module.lessons;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: lessons.length,
                      itemBuilder: (context, index) {
                        return AllSubjectSpecificSubject(moduleName: module.module, lesson: lessons[index]);
                      },
                    );
                  }

                  return const Center(
                    child: Text('There is no lessons available'),
                  );
                },
              ),

              Positioned(
                left: 280.h,
                top: 5.w,
                child: Container(
                  height: 20.w,
                  width: 155.h,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 166, 71),
                    border: Border.all(color: AppColors.primaryColor, width: 5.h),
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
                    border: Border.all(color: AppColors.primaryColor, width: 5.h),
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

  BoxDecoration lessonsDecoration() {
    return BoxDecoration(
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
    );
  }
}
