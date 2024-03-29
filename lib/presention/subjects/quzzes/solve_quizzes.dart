// import 'package:eduninjav2/core/constants/bloc_progress.dart';
// import 'package:eduninjav2/presention/ads/google_ads.dart';
// import 'package:eduninjav2/presention/cms/bloc/cms_bloc.dart';
// import 'package:eduninjav2/presention/cms/model/cms.dart';
// import 'package:eduninjav2/presention/user_level/bloc/user_level_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SolveQuizzes extends StatefulWidget {
//   final Lesson? lesson;

//   const SolveQuizzes({
//     super.key,
//     this.lesson,
//   });

//   @override
//   State<SolveQuizzes> createState() => _SolveQuizzesState();
// }

// class _SolveQuizzesState extends State<SolveQuizzes> {
//   int count = 0;
//   final GlobalKey<FormState> _form = GlobalKey();
//   final String answer = 'oxygen';
//   String enteredValue = '';

//   bool isCorrect() {
//     return enteredValue == answer;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Material(
//         color: Colors.transparent,
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             BlocBuilder<UserLevelBloc, UserLevelState>(builder: (context, state) {
//               return Form(
//                 key: _form,
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(
//                       // color: AppColors.primaryColor,
//                       width: 2.w,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
//                       child: BlocBuilder<CmsBloc, CmsState>(
//                         builder: (context, state) {
//                           if (state.blocProgress == BlocProgress.IS_LOADING) {
//                             return const Center(child: CircularProgressIndicator(color: Colors.white));
//                           }
//                           if (state.blocProgress == BlocProgress.FAILED) {
//                             return const Center(child: CircularProgressIndicator(color: Colors.white));
//                           }
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Fill in the gaps',
//                                 style: TextStyle(
//                                   fontSize: 28.sp,
//                                   fontWeight: FontWeight.bold,
//                                   // color: AppColors.primaryColor,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                               SizedBox(height: 40.h),
//                               Text(
//                                 widget.lesson?.question ?? 'error occured',
//                                 style: TextStyle(fontSize: 28.sp),
//                               ),
//                               SizedBox(height: 20.h),
//                               Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.w),
//                                 child: TextFormField(
//                                   onChanged: (value) {
//                                     setState(() {
//                                       enteredValue = value;
//                                     });
//                                   },
//                                   decoration: const InputDecoration(
//                                     hintText: 'Enter the Value',
//                                   ),
//                                   validator: (text) {
//                                     if (text?.isNotEmpty != true) {
//                                       return 'Value can not be empty';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                               SizedBox(height: 20.h),
//                               ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     minimumSize: Size(300, 50.h), backgroundColor: Colors.red.shade900),
//                                 onPressed: isCorrect()
//                                     ? () {
//                                         context.read<UserLevelBloc>().updateUserLevel();
//                                         showDialog(
//                                           context: context,
//                                           builder: (context) => AlertDialog(
//                                             title: const Text(
//                                               'Correct!',
//                                               style: TextStyle(fontWeight: FontWeight.bold),
//                                             ),
//                                             content: const Text('You have earned 1 extra point)'),
//                                             actions: <Widget>[
//                                               ElevatedButton(
//                                                 style: ElevatedButton.styleFrom(
//                                                     minimumSize: Size(double.infinity, 50.h),
//                                                     backgroundColor: Colors.red.shade900),
//                                                 child: const Text('OK'),
//                                                 onPressed: () {
//                                                   Navigator.of(context).pop();
//                                                   Navigator.of(context).pop();
//                                                   Navigator.of(context).pop();
//                                                   showDialog(
//                                                     context: context,
//                                                     builder: (BuildContext context) {
//                                                       return const GoogleAds();
//                                                     },
//                                                   );
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                       }
//                                     : () {
//                                         showDialog(
//                                           context: context,
//                                           builder: (context) => AlertDialog(
//                                             title: const Text(
//                                               'Incorrect!',
//                                               style: TextStyle(fontWeight: FontWeight.bold),
//                                             ),
//                                             content: const Text('Please try again'),
//                                             actions: <Widget>[
//                                               ElevatedButton(
//                                                 style: ElevatedButton.styleFrom(
//                                                     minimumSize: Size(double.infinity, 50.h),
//                                                     backgroundColor: Colors.red.shade900),
//                                                 child: const Text('OK'),
//                                                 onPressed: () {
//                                                   Navigator.of(context).pop();
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                 child: const Text('Check Results'),
//                               ),
//                             ],
//                           );
//                         },
//                       )),
//                 ),
//               );
//             }),
//             Positioned(
//               right: 7.w,
//               top: 10.h,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(7),
//                   decoration: BoxDecoration(color: Colors.red.shade900, borderRadius: BorderRadius.circular(50)),
//                   child: const Icon(
//                     Icons.close,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
