import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

bool continueTo = false;

class StudyTopics extends StatefulWidget {
  const StudyTopics({super.key});

  @override
  State<StudyTopics> createState() => _StudyTopicsState();
}

class _StudyTopicsState extends State<StudyTopics> {
  @override
  Widget build(BuildContext context) {
    return Material(
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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    const Text('Lesson 1 of 5'),
                    SizedBox(height: 20.h),
                    Text(
                      'Civil War (Part 1)',
                      style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    const Divider(height: 1, color: Colors.black),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        'Why it matters',
                        style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      """Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, ery popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32 The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, ery popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32 The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.""",
                      style: TextStyle(fontSize: 22.sp),
                    ),
                    SizedBox(height: 20.h),
                    const CircularWhileLoading(
                        link: 'https://www.authentikusa.com/uploads/images/orig/guide-voyage/usa-map-only.jpg'),
                    SizedBox(height: 40.h),
                    if (continueTo == false)
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(300, 50.h),
                                // maximumSize: const Size(200, 50),
                                backgroundColor: Colors.red.shade900),
                            onPressed: () {
                              setState(() {
                                continueTo = !continueTo;
                              });
                            },
                            child: const Text('Continue')),
                      ),
                    if (continueTo == true)
                      Column(
                        children: [
                          const Divider(height: 1, color: Colors.black),
                          SizedBox(height: 40.h),
                          const CircularWhileLoading(
                              link:
                                  'https://www.youramericanflagstore.com/wp-content/uploads/2018/09/products-LIncoln_6.jpg'),
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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 7.w,
            top: 10.h,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
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
    );
  }
}

class CircularWhileLoading extends StatelessWidget {
  const CircularWhileLoading({
    Key? key,
    required this.link,
  }) : super(key: key);

  final String link;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        link,
        frameBuilder: ((context, child, frame, wasSynchronouslyLoaded) {
          return child;
        }),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return CircularPercentIndicator(
              radius: 20,
            );
          }
        },
      ),
    );
  }
}
