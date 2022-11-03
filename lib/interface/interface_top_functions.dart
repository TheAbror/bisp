import 'package:eduninjav2/interface/interface_left_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'interface_right_functions.dart';

class InterfaceTopFunctions extends StatelessWidget {
  const InterfaceTopFunctions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          LeftMenuItems(),
          Spacer(),
          RightMenuItems(),
        ],
      ),
    );
  }
}
