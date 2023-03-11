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
        borderRadius: BorderRadius.circular(20),
        color: Colors.cyan[800],
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
                          // margin: EdgeInsets.only(right: 5.w),
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
              Expanded(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  SubjectsSettingsItems(),
                                  SubjectsSettingsItems(),
                                  SubjectsSettingsItems(),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  SubjectsSettingsItems(),
                                  SubjectsSettingsItems(),
                                  SubjectsSettingsItems(),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  SubjectsSettingsItems(),
                                  SubjectsSettingsItems(),
                                  SubjectsSettingsItems(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Divider(height: 10, color: Colors.black),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6.h),
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text('Terms of services'),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6.h),
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text('Privacy Policy'),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6.h),
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text('Help and Support'),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubjectsSettingsItems extends StatelessWidget {
  const SubjectsSettingsItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Music'),
        SizedBox(height: 3.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          width: 40.w,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: const Center(
            child: Text(
              'ON',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
