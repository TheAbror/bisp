import 'package:eduninjav2/presention/settings/settings_main.dart';
import 'package:eduninjav2/presention/subjects/widgets/no_internet.dart';
import 'package:eduninjav2/presention/user_level/user_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eduninjav2/core/constants/bloc_progress.dart';
import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/core/constants/values/custom_dropdownbutton.dart';
import 'package:eduninjav2/core/constants/values/topRight_functions.dart';
import 'package:eduninjav2/presention/cms/bloc/cms_bloc.dart';
import 'package:eduninjav2/presention/cms/model/cms.dart';
import 'package:eduninjav2/presention/subjects/subject_inner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllSubjects extends StatefulWidget {
  const AllSubjects({super.key});

  @override
  State<AllSubjects> createState() => _AllSubjectsState();
}

String username = '';
int level = 1;

class _AllSubjectsState extends State<AllSubjects> {
  String? selectedGrade;
  List<String> grades = ['Grade 7'];
  bool music = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<CmsBloc, CmsState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }
          if (state.blocProgress == BlocProgress.FAILED) {
            return const NoInternet();
          }

          return Container(
            decoration: decorationSubjects(),
            child: SafeArea(
              bottom: false,
              right: false,
              left: false,
              child: Stack(
                children: [
                  _LessonsList(moduleName: state.selectModuleName, lessonsList: state.lessonsList),
                  Positioned(
                    left: 280.h,
                    top: 5.w,
                    child: Container(
                      height: 20.w,
                      width: 169.h,
                      decoration: decorationDropdowns(),
                      child: CustomDropdownButton(
                        hint: 'All Subjects',
                        dropdownItems: state.moduleNamesList,
                        dropdownElevation: 2,
                        selectedValue: state.selectModuleName,
                        onChanged: (value) {
                          context.read<CmsBloc>().selectedModule(value);
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
                      decoration: decorationDropdowns(),
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
                              context: context,
                              builder: (BuildContext context) {
                                return const SubjectSettings();
                              },
                            );
                          },
                        ),
                        SizedBox(width: 20.h),
                        TopRightFunctions(
                          icon: Icons.priority_high,
                          onTap: () {
                            print('assign function');
                          },
                        ),
                        SizedBox(width: 20.h),
                      ],
                    ),
                  ),
                  //name and level
                  Positioned(
                    top: 5.w,
                    left: 42,
                    child: InkWell(
                      onTap: () {
                        print('object');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const UserLevel();
                          },
                        );
                      },
                      child: Container(
                        width: 180.h,
                        decoration: decorationDropdowns(),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 8.h),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text(username[0].toUpperCase()),
                              ),
                            ),
                            Column(
                              children: [
                                Text(username),
                                Text(' Level $level'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration decorationDropdowns() {
    return BoxDecoration(
      color: const Color.fromARGB(255, 225, 166, 71),
      border: Border.all(color: AppColors.primaryColor, width: 5.h),
      borderRadius: BorderRadius.circular(10),
    );
  }

  BoxDecoration decorationSubjects() {
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

class _LessonsList extends StatelessWidget {
  final String moduleName;
  final List<Lesson> lessonsList;

  const _LessonsList({
    Key? key,
    required this.moduleName,
    required this.lessonsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (lessonsList.isEmpty) {
      return Center(
        child: Text(
          ':)\nNo Lessons \nHave Some Rest)',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lessonsList.length,
        itemBuilder: (context, index) {
          return AllSubjectSpecificSubject(moduleName: moduleName, lesson: lessonsList[index]);
        },
      );
    }
  }
}
