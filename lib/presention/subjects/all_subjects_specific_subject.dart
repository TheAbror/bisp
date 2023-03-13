import 'package:eduninjav2/core/constants/bloc_progress.dart';
import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/presention/cms/bloc/cms_bloc.dart';
import 'package:eduninjav2/presention/cms/model/cms.dart';
import 'package:eduninjav2/presention/subjects/widgets/study_topic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllSubjectSpecificSubject extends StatelessWidget {
  final String moduleName;
  final Lesson lesson;

  const AllSubjectSpecificSubject({
    Key? key,
    required this.moduleName,
    required this.lesson,
  }) : super(key: key);

  static const primaryColor = Color(0xFF8F563C);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 110.w,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  height: 90.w,
                  width: 180.h,
                  decoration: boxDesign(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: boxDesign2(),
                        child: Image.network(
                          lesson.image,
                          height: 40.w,
                          width: 145.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 22.w,
                        child: Text(
                          lesson.subtitle,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                //top of the container
                Positioned.fill(
                  top: 9.w,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 20.w,
                      width: 130.h,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(color: primaryColor, width: 2.h),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          lesson.title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.w),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Material(
                    color: Colors.transparent,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        BlocBuilder<CmsBloc, CmsState>(
                          builder: (context, state) {
                            if (state.blocProgress == BlocProgress.IS_LOADING) {
                              return const Center(child: CircularProgressIndicator(color: Colors.white));
                            }

                            if (state.cms.isEmpty) {
                              return const SizedBox();
                            }

                            return Container(
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20.h),
                                          const Text('Lesson 1 of 5'),
                                          SizedBox(height: 20.h),
                                          Text(
                                            lesson.title,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 20.h),
                                          const Divider(height: 1, color: Colors.black),
                                          SizedBox(height: 20.h),
                                          Text(
                                            lesson.subtitle,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 20.h),
                                          Text(
                                            lesson.body,
                                            style: TextStyle(fontSize: 22.sp),
                                          ),
                                          SizedBox(height: 20.h),
                                          Center(
                                            child: Image.network(
                                              lesson.image,
                                              height: 80.w,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(height: 40.h),
                                          Center(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: Size(300, 50.h),
                                                    // maximumSize: const Size(200, 50),
                                                    backgroundColor: Colors.red.shade900),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Finish')),
                                          ),
                                          SizedBox(height: 40.h),
                                        ],
                                      ),
                                    );
                                  }),
                            );
                          },
                        ),
                        Positioned(
                          right: 7.w,
                          top: 10.h,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration:
                                  BoxDecoration(color: Colors.red.shade900, borderRadius: BorderRadius.circular(50)),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const StudyTopicButton(),
          ),
        ],
      ),
    );
  }
}
