import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'view/my_profile_percentage.dart';

class MyClass extends StatefulWidget {
  const MyClass({super.key});

  @override
  State<MyClass> createState() => _MyClassState();
}

List mylist = [
  'Alex',
  'Adam',
  'Christie',
  'Art',
  'Tiana',
  'Mia',
  'Herbey',
  'Keanu',
  'Tiana',
  'Mia',
  'Herbey',
  'Keanu',
];

class _MyClassState extends State<MyClass> {
  @override
  Widget build(BuildContext context) {
    var reversedList = mylist.reversed.toList();
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // reverse: true,
      itemCount: mylist.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 1, color: Colors.black),
      itemBuilder: (BuildContext context, int index) {
        int order = index + 1;
        // int neworder = order.reversed.toList();
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
                  subject: reversedList[index],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
