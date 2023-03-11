import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/presention/my_profile/view/my_profile_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool chatOpenWatch = true;

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  final videoURL = 'https://www.youtube.com/watch?v=kXYiU_JCYtU&list=RDkXYiU_JCYtU&index=1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    margin: EdgeInsets.only(top: 10.h, bottom: 10.h, right: chatOpenWatch ? 130.w : 0),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      border: Border.all(color: AppColors.primaryColor, width: 5),
                      borderRadius: BorderRadius.circular(20),
                      image:
                          const DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/cat-7544821.jpg')),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: chatOpenWatch ? 130.w : 0, bottom: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(color: AppColors.primaryColor, width: 5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Objectives: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Get the background knowledge about Civil War  ',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: chatOpenWatch ? 0 : 21.w,
            top: 0,
            bottom: 0,
            child: Row(
              children: [
                //open-closing arrows
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chatOpenWatch = !chatOpenWatch;
                    });
                  },
                  child: Container(
                    width: chatOpenWatch ? 8.w : 12.w,
                    height: chatOpenWatch ? 55.h : 45.h,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: chatOpenWatch ? const Radius.circular(13) : const Radius.circular(5),
                        bottomLeft: chatOpenWatch ? const Radius.circular(13) : const Radius.circular(5),
                        bottomRight: chatOpenWatch ? const Radius.circular(0) : const Radius.circular(5),
                        topRight: chatOpenWatch ? const Radius.circular(0) : const Radius.circular(5),
                      ),
                      border: Border.all(
                        color: Colors.green.shade900,
                      ),
                    ),
                    child: Icon(
                      chatOpenWatch ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  ),
                ),
                Container(
                  width: chatOpenWatch ? 137.w : 0,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.cyanAccent,
                          child: Row(
                            children: [
                              SizedBox(width: chatOpenWatch ? 20 : 0),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    barrierColor: Colors.grey.shade200.withOpacity(0.8),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const MyProfile();
                                    },
                                  );
                                },
                                child: Container(
                                  width: chatOpenWatch ? 70.w : 0,
                                  height: chatOpenWatch ? 25.h : 0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: GestureDetector(
                                      child: const Text(
                                        'Black Dragons',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: chatOpenWatch ? 20 : 0),
                              const Text('Online 12/32'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: ListView.separated(
                            itemCount: 20,
                            separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 66.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    const Icon(Icons.account_circle, color: Colors.white),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('User $index '),
                                        SizedBox(
                                          width: 90.w,
                                          child: Text(
                                            'Message $index goes right vbn vbn cvb  vbn ',
                                            maxLines: 3,
                                            softWrap: false,
                                            // overflow: TextOverflow.fade,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(flex: 1),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '5:1$index',
                                        ),
                                      ],
                                    ),
                                    const Spacer(flex: 5),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.cyanAccent,
                          child: Row(
                            children: [
                              SizedBox(width: chatOpenWatch ? 20 : 0),

                              SizedBox(
                                width: chatOpenWatch ? 100.w : 0,
                                height: chatOpenWatch ? 35.h : 0,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                      filled: true,
                                      hintStyle: TextStyle(color: Colors.grey[800]),
                                      hintText: "Type in your text",
                                      fillColor: Colors.white70),
                                ),
                              ),
                              SizedBox(width: chatOpenWatch ? 5.w : 0),
                              //send input
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.send,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
