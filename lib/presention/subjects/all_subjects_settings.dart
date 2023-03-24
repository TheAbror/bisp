import 'package:eduninjav2/presention/subjects/settings_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectSettings extends StatefulWidget {
  const SubjectSettings({super.key});

  @override
  State<SubjectSettings> createState() => _SubjectSettingsState();
}

class _SubjectSettingsState extends State<SubjectSettings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 1, 91, 100),
        child: Container(
          margin: EdgeInsets.only(top: 5.h),
          height: 455.h,
          width: 300.w,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    children: [
                      const Spacer(),
                      const Text(
                        'Settings',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(1.w),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 9,
                child: SettingsBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsTerms extends StatelessWidget {
  final String text;
  final String buttonName;
  final VoidCallback? onTap;
  const SettingsTerms({
    Key? key,
    required this.text,
    required this.buttonName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierColor: Colors.grey.shade900.withOpacity(1),
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        width: 55.w,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
