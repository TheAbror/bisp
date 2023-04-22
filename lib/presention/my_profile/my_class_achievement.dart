import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
  'Herbey',
  'Keanu',
];

class _MyClassState extends State<MyClass> {
  @override
  Widget build(BuildContext context) {
    // Sort the list in descending order based on name length
    mylist.sort((a, b) => b.length.compareTo(a.length));
    // Reverse the list
    var reversedList = mylist.reversed.toList();

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      reverse: false,
      itemCount: mylist.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 1, color: Colors.black),
      itemBuilder: (BuildContext context, int index) {
        int order = index + 1;
        double percentforRanking = 1.0 - (index / mylist.length);

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

class MyProfileSubjectPercentage extends StatelessWidget {
  const MyProfileSubjectPercentage({
    Key? key,
    required this.percentage,
    required this.subject,
  }) : super(key: key);

  final double percentage;
  final String subject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          subject,
          style: TextStyle(fontSize: 22.sp),
        ),
        const Spacer(),
        LinearPercentIndicator(
          width: 84.w,
          lineHeight: 30.h,
          percent: percentage,
          backgroundColor: AppColors.taskbarBackground,
          progressColor: AppColors.settingsTopColor,
          barRadius: const Radius.circular(32),
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 1,
          ),
          center: Text(
            "${(percentage * 100).round()}%",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
