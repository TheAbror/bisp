import 'package:eduninjav2/core/constants/bloc_progress.dart';
import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/presention/cms/bloc/cms_bloc.dart';
import 'package:eduninjav2/presention/cms/model/cms.dart';
import 'package:eduninjav2/presention/subjects/widgets/study_topic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class AllSubjectSpecificSubject extends StatelessWidget {
  final String moduleName;
  final Lesson lesson;

  const AllSubjectSpecificSubject({
    Key? key,
    required this.moduleName,
    required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool finished = false;
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CmsBloc, CmsState>(
            builder: (context, state) {
              if (state.blocProgress == BlocProgress.IS_LOADING) {
                return const Center(child: CircularProgressIndicator(color: Colors.white));
              }
              return SizedBox(
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: (lesson.image.contains('youtube'))
                                  ? SizedBox(
                                      height: 40.w,
                                      width: 145.h,
                                      child: YoutubePlayer(
                                          controller: YoutubePlayerController.fromVideoId(
                                        videoId: getYoutubeIdFromUrl(lesson.image),
                                        autoPlay: false,
                                        params: const YoutubePlayerParams(showFullscreenButton: false),
                                      )),
                                    )
                                  : Image.network(
                                      lesson.image,
                                      height: 40.w,
                                      width: 145.h,
                                      fit: BoxFit.fill,
                                      loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                      errorBuilder: (ctx, error, stackTrace) {
                                        return Container(
                                          height: 40.w,
                                          width: 145.h,
                                          color: Colors.grey.withOpacity(0.3),
                                          child: const Center(
                                            child: Text(
                                              'No Photo',
                                              style: TextStyle(color: AppColors.primaryColor),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 22.w,
                            child: Text(
                              lesson.subtitle,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(color: AppColors.primaryColor),
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
                            border: Border.all(color: AppColors.primaryColor, width: 2.h),
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
              );
            },
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
                                            child: InteractiveViewer(
                                              panEnabled: false,
                                              minScale: 0.5,
                                              maxScale: 2,
                                              child: (lesson.image.contains('youtube'))
                                                  ? Container(
                                                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                      width: double.infinity,
                                                      child: YoutubePlayer(
                                                          controller: YoutubePlayerController.fromVideoId(
                                                        videoId: getYoutubeIdFromUrl(lesson.image),
                                                        autoPlay: false,
                                                        params: const YoutubePlayerParams(showFullscreenButton: true),
                                                      )),
                                                    )
                                                  : Image.network(
                                                      lesson.image,
                                                      height: 40.w,
                                                      width: 145.h,
                                                      fit: BoxFit.fill,
                                                      loadingBuilder: (context, child, loadingProgress) {
                                                        if (loadingProgress == null) {
                                                          return child;
                                                        } else {
                                                          return const Center(
                                                            child: CircularProgressIndicator(),
                                                          );
                                                        }
                                                      },
                                                      errorBuilder: (ctx, error, stackTrace) {
                                                        return Container(
                                                          height: 40.w,
                                                          width: 145.h,
                                                          color: Colors.grey.withOpacity(0.3),
                                                          child: const Center(
                                                            child: Text(
                                                              'No Photo',
                                                              style: TextStyle(color: AppColors.primaryColor),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                            ),
                                          ),
                                          SizedBox(height: 40.h),
                                          Center(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: Size(300, 50.h), backgroundColor: Colors.red.shade900),
                                                onPressed: () {
                                                  // finished = != finished;
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

  String getYoutubeIdFromUrl(String url) {
    final pos = url.indexOf('?v=');
    if (pos == -1) {
      return '';
    }
    final res = url.substring(pos + 3, url.length);
    if (res.contains('&')) {
      final pos2 = res.indexOf('&');
      if (pos2 > 0) {
        return res.substring(0, pos2);
      }
    }
    return res;
  }
}
