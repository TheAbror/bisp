import '../presention/my_profile/view/my_profile_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool chatOpen = false;

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: chatOpen ? 0 : 30.w,
      top: 0,
      bottom: 0,
      child: Row(
        children: [
          //open-closing arrows
          GestureDetector(
            onTap: () {
              setState(() {
                chatOpen = !chatOpen;
              });
            },
            child: Container(
              width: chatOpen ? 10.w : 15.w,
              height: chatOpen ? 65.h : 55.h,
              decoration: BoxDecoration(
                color: chatOpen ? Colors.green : Colors.red.shade800,
                borderRadius: BorderRadius.only(
                  topLeft: chatOpen ? const Radius.circular(13) : const Radius.circular(5),
                  bottomLeft: chatOpen ? const Radius.circular(13) : const Radius.circular(5),
                  bottomRight: chatOpen ? const Radius.circular(0) : const Radius.circular(5),
                  topRight: chatOpen ? const Radius.circular(0) : const Radius.circular(5),
                ),
                border: Border.all(color: chatOpen ? Colors.green : Colors.red.shade900, width: 2.w),
              ),
              child: Icon(
                chatOpen ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 25.sp,
              ),
            ),
          ),
          Container(
            width: chatOpen ? 137.w : 0,
            color: Colors.green,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: chatOpen ? 20 : 0),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              // barrierColor: Colors.grey.shade200.withOpacity(0.9),
                              context: context,
                              builder: (BuildContext context) {
                                return const MyProfile();
                              },
                            );
                          },
                          child: Container(
                            width: chatOpen ? 70.w : 0,
                            height: chatOpen ? 25.h : 0,
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
                        SizedBox(width: chatOpen ? 20 : 0),
                        const Text('Online 5/15'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const Icon(Icons.account_circle, color: Colors.white),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Mia',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: const Text(
                                    'Hi there, what was the task?',
                                    maxLines: 3,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 5),
                          ],
                        ),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const Icon(Icons.account_circle, color: Colors.white),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Keanu',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: const Text(
                                    'To study about Chemical basis',
                                    maxLines: 3,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 5),
                          ],
                        ),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const FlutterLogo(),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Admin',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: const Text(
                                    'Kids prepare for exams well',
                                    maxLines: 2,
                                    softWrap: false,
                                    // overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 5),
                          ],
                        ),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const Icon(Icons.account_circle, color: Colors.white),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Art',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: const Text(
                                    'Sure',
                                    maxLines: 2,
                                    softWrap: false,
                                    // overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 5),
                          ],
                        ),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const Icon(Icons.account_circle, color: Colors.white),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Mike',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: const Text(
                                    'Thank you for reminding',
                                    maxLines: 2,
                                    softWrap: false,
                                    // overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 5),
                          ],
                        ),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const Icon(Icons.account_circle, color: Colors.white),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Scott',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: const Text(
                                    'Thanks',
                                    maxLines: 2,
                                    softWrap: false,
                                    // overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 5),
                          ],
                        ),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const Icon(Icons.account_circle, color: Colors.white),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Jennifer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: const Text(
                                    'We will do our best',
                                    maxLines: 2,
                                    softWrap: false,
                                    // overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 5),
                          ],
                        ),
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            const FlutterLogo(),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Admin',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.w,
                                  child: const Text(
                                    'No problem',
                                    maxLines: 2,
                                    softWrap: false,
                                    // overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 5),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: chatOpen ? 20 : 0),

                        SizedBox(
                          width: chatOpen ? 100.w : 0,
                          height: chatOpen ? 35.h : 0,
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
                        SizedBox(width: chatOpen ? 5.w : 0),
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
    );
  }
}
