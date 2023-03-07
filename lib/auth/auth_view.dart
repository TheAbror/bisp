import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/pages/select_hero_.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  // @override
  // dispose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                SvgPicture.asset(
                  'assets/images/main.svg',
                  height: 250.w,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 68.h,
                  child: textFieldID(),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 68.h,
                  child: textFieldPassword(),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'ENTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled) ? null : Colors.orange;
                      }),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {
                      SystemChrome.setPreferredOrientations(
                          [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const SelectHero(),
                          ),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _usernameController = TextEditingController(text: '20000001');
  final _passwordController = TextEditingController(text: '123456');
  bool isHiddenPassword = false;

  TextFormField textFieldID() {
    return TextFormField(
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Please enter your student id';
        }
        return null;
      },
      controller: _usernameController,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        labelText: 'Student ID',
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.w),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.w),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1.w),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.withOpacity(0.4), width: 1.w),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  TextFormField textFieldPassword() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      controller: _passwordController,
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        labelText: 'Password',
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        // contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.w),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.w),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1.w),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.withOpacity(0.4), width: 1.w),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: InkWell(
          onTap: _togglePasswordView,
          child: isHiddenPassword
              ? Icon(
                  Icons.visibility_outlined,
                  size: 18.sp,
                  color: Colors.orange,
                )
              : Icon(
                  Icons.visibility_off_outlined,
                  size: 18.sp,
                  color: Colors.orange.withOpacity(0.4),
                ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
