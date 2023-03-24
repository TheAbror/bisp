import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

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
                        'Select Language',
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
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    LanguageItem(
                      language: 'Uzbek',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    LanguageItem(
                      language: 'English',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    LanguageItem(
                      language: 'Russian',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String language;
  final VoidCallback? onTap;
  final Icon? icon;
  const LanguageItem({
    Key? key,
    required this.language,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Text(language),
              const Spacer(),
              if (language == 'English') const Icon(Icons.done),
            ],
          ),
        ),
      ),
    );
  }
}
