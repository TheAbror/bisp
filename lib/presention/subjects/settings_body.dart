import 'package:eduninjav2/presention/subjects/all_subjects_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://t.me/+dixVuR-vLUoyMmQy');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SubjectsSettingsItems(),
                      SubjectsSettingsItems(),
                      SubjectsSettingsItems(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SubjectsSettingsItems(),
                      SubjectsSettingsItems(),
                      SubjectsSettingsItems(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    const SettingsTerms(
                      text:
                          'Our mission is to provide an innovative educational application that empowers learners to achieve their full potential. We strive to create a platform that is accessible, engaging, and personalized to meet the unique learning needs of each individual. Our goal is to facilitate a lifelong love of learning by providing a comprehensive, interactive, and fun educational experience. We are committed to delivering high-quality content that is relevant, up-to-date, and aligned with the latest educational standards. Our application is designed to support all learners and we are dedicated to creating a safe and inclusive community where everyone can thrive.',
                      buttonName: 'Our Mission',
                    ),
                    const SettingsTerms(
                      text:
                          '''We believe all users of the Edu Ninja app are entitled to their privacy and have built Edu Ninja around this central principle. In fact, it was one of the main reasons why we decided to build this app.
Not only do we promise not to use your data for malicious purposes, we will always ensure data collection is avoided or at the very least kept to a minimum only to facilitate app functionality.
Whilst the app requires your location data to present data for your specific geolocation, this is all done directly on the phone and no data whatsoever is collected or stored by Edu Ninja.
No other data is collected (including analytics or personal information), except for email addresses of individuals who have signed up to our mailing list (to facilitate newsletter updates and/or beta app testers (to allow us to invite them to download the beta-version of our app).
For more information, please read the full privacy policy on our website.
Edu Ninja v1.0.0 ''',
                      buttonName: 'Privacy Policy',
                    ),
                    GestureDetector(
                      onTap: _launchUrl,
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
                        child: const Center(
                          child: Text('Support'),
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
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
