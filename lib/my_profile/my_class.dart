import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_profile_subject_percentage.dart';

class MyClass extends StatefulWidget {
  const MyClass({super.key});

  @override
  State<MyClass> createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1, color: Colors.black),
        itemBuilder: (BuildContext context, int index) {
          int order = index + 1;
          double percentforRanking = order / 100 + 0.8;
          return SizedBox(
            height: 66.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$order. '),
                if (order < 4) const Icon(Icons.thumb_up),
                Expanded(
                  child: MyProfileSubjectPercentage(
                    percentage: percentforRanking,
                    subject: 'Steve',
                  ),
                )
              ],
            ),
          );
        });
  }
}
