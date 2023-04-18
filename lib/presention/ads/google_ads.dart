import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class GoogleAds extends StatefulWidget {
  const GoogleAds({super.key});

  @override
  State<GoogleAds> createState() => _GoogleAdsState();
}

class _GoogleAdsState extends State<GoogleAds> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Container(
          height: 470.h,
          width: 240.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red.shade900,
              width: 5.h,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        height: 400.h,
                        width: 300.w,
                        child: const RiveAnimation.asset('assets/gifs/bear_ad.riv'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Great Job!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Image.asset(
                          'assets/images/google_ads_logo_icon_171064.png',
                          width: 50.r,
                          height: 50.r,
                        )
                      ],
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
