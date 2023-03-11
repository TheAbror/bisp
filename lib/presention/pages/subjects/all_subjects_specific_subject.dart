import 'package:eduninjav2/core/constants/bloc_progress.dart';
import 'package:eduninjav2/presention/cms/bloc/cms_bloc.dart';
import 'package:eduninjav2/presention/watch/study_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllSubjectSpecificSubject extends StatelessWidget {
  const AllSubjectSpecificSubject({
    Key? key,
  }) : super(key: key);

  static const primaryColor = Color(0xFF8F563C);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 225, 166, 71),
                  border: Border.all(color: primaryColor, width: 5.h),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 5.h),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        'https://9b16f79ca967fd0708d1-2713572fef44aa49ec323e813b06d2d9.ssl.cf2.rackcdn.com/1140x_a10-7_cTC/933883116-1593465661.jpg',
                        height: 40.w,
                        width: 145.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 22.w,
                      child: const Text(
                        'The First Americans The Civil War some more text',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: primaryColor),
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
                  child: BlocBuilder<CmsBloc, CmsState>(
                    builder: (context, state) {
                      if (state.blocProgress == BlocProgress.IS_LOADING) {
                        return const Center(child: CircularProgressIndicator(color: Colors.white));
                      }
                      if (state.cms.isEmpty) {
                        return const Text('error');
                      }

                      return Container(
                        height: 20.w,
                        width: 130.h,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(color: primaryColor, width: 3.h),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            'US History  Language Art',
                            // state.cms?.first.module ?? 'fsdfsdf',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                          ),
                        )),
                      );
                    },
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
                return const StudyTopics();
              },
            );
          },
          child: Container(
            height: 20.w,
            width: 130.h,
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: primaryColor, width: 3.h),
              borderRadius: BorderRadius.circular(17),
            ),
            child: const Center(
                child: Text(
              'Study Topic',
              style: TextStyle(color: primaryColor),
            )),
          ),
        ),
      ],
    );
  }
}
