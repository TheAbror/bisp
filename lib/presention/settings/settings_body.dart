import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/presention/settings/settings_main.dart';
import 'package:eduninjav2/presention/skins/skins.dart';
import 'package:eduninjav2/presention/subjects/language/language_select.dart';
import 'package:eduninjav2/presention/user_level/bloc/user_level_bloc.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://t.me/+dixVuR-vLUoyMmQy');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

bool isSoundPlaying = true;
bool isMusicPlaying = false;

class SettingsBody extends StatefulWidget {
  const SettingsBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          eduNinjaId(context),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                SizedBox(height: 50 / 2.h),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SubjectsSettingsItems(
                        // music ? Icons.mic : Icons.mic_off,
                        text: isSoundPlaying ? 'ON' : 'OFF',
                        actionName: 'Song',
                        onTap: () {
                          if (isSoundPlaying == false) FlameAudio.bgm.play('mona.mp3');
                          if (isSoundPlaying == true) FlameAudio.bgm.pause();
                          setState(() {
                            isSoundPlaying = !isSoundPlaying;
                          });
                        },
                      ),
                      SubjectsSettingsItems(
                        text: isMusicPlaying ? 'ON' : 'OFF',
                        actionName: 'Music',
                        onTap: () {
                          if (isMusicPlaying == false) FlameAudio.bgm.play('Mozart.mp3');
                          if (isMusicPlaying == true) FlameAudio.bgm.pause();
                          setState(() {
                            isMusicPlaying = !isMusicPlaying;
                          });
                        },
                      ),
                      BlocBuilder<UserLevelBloc, UserLevelState>(
                        builder: (context, state) {
                          return SubjectsSettingsItems(
                            text: 'Level ${state.level.toStringAsFixed(2)}',
                            actionName: 'Skins',
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const SkinsPage();
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SubjectsSettingsItems(
                        actionName: 'Language',
                        text: 'English',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const SelectLanguage();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Terms(),
        ],
      ),
    );
  }

  Expanded eduNinjaId(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: decoration(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Row(
            children: [
              const Text(
                'Edu Ninja ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.h),
                  child: const Text(
                    'ID',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'Connect to Edu Ninja ID \nto safeguard your game',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showDialog(
                    barrierColor: Colors.grey.shade900.withOpacity(0.0),
                    context: context,
                    builder: (BuildContext context) {
                      return const Center(
                        child: Text(
                          'text',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: buttonConntected(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    child: const Text(
                      'Connected',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration buttonConntected() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade900,
          Colors.blue.shade900,
          Colors.blue.shade800,
          Colors.blue.shade700,
        ],
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade900,
          Colors.blue.shade900,
          Colors.blue.shade900,
          Colors.blue.shade900,
          Colors.blue.shade800,
          Colors.blue.shade800,
          Colors.blue.shade600,
          Colors.blue.shade600,
          Colors.blue.shade400,
          Colors.blue.shade400,
          Colors.blue.shade400,
        ],
      ),
    );
  }
}

class Terms extends StatelessWidget {
  const Terms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(height: 1.h, color: Colors.black),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SettingsTerms(
                  text:
                      'Our mission is to provide an innovative educational application that empowers learners to achieve their full potential. We strive to create a platform that is accessible, engaging, and personalized to meet the unique learning needs of each individual. Our goal is to facilitate a lifelong love of learning by providing a comprehensive, interactive, and fun educational experience. We are committed to delivering high-quality content that is relevant, up-to-date, and aligned with the latest educational standards. Our application is designed to support all learners and we are dedicated to creating a safe and inclusive community where everyone can thrive.',
                  buttonName: 'Our Mission',
                ),
                const SettingsTerms(
                  text:
                      '''We believe all users of the Edu Ninja app are entitled to their privacy and have built Edu Ninja around this central principle. In fact, it was one of the main reasons why we decided to build this app. Not only do we promise not to use your data for malicious purposes, we will always ensure data collection is avoided or at the very least kept to a minimum only to facilitate app functionality. Whilst the app requires your location data to present data for your specific geolocation, this is all done directly on the phone and no data whatsoever is collected or stored by Edu Ninja. No other data is collected (including analytics or personal information), except for email addresses of individuals who have signed up to our mailing list (to facilitate newsletter updates and/or beta app testers (to allow us to invite them to download the beta-version of our app). For more information, please read the full privacy policy on our website. Edu Ninja v1.0.0 ''',
                  buttonName: 'Privacy Policy',
                ),
                GestureDetector(
                  onTap: _launchUrl,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    width: 55.w,
                    decoration: BoxDecoration(
                      color: AppColors.settings,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(1, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Support',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class SubjectsSettingsItems extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String actionName;
  const SubjectsSettingsItems({
    Key? key,
    required this.text,
    this.onTap,
    required this.actionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(actionName),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            width: 40.w,
            decoration: BoxDecoration(
              color: AppColors.settings,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 2), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
