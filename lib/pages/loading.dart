import 'package:eduninjav2/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Desktop - 4.jpg'),
              fit: BoxFit.contain),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 60.h,
              child: const Center(
                  child: Text(
                'Loading',
                style: TextStyle(color: Colors.white),
              )),
            ),
            Positioned(
              bottom: 50.h,
              child: LinearPercentIndicator(
                width: 180,
                lineHeight: 10.h,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                percent: 1,
                alignment: MainAxisAlignment.center,
                animation: true,
                animationDuration: 1000,
                onAnimationEnd: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                barRadius: const Radius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
