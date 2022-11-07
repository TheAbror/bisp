import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfileSocial extends StatefulWidget {
  const MyProfileSocial({super.key});

  @override
  State<MyProfileSocial> createState() => _MyProfileSocialState();
}

class _MyProfileSocialState extends State<MyProfileSocial> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const MySoicalItem(
              text: "Friends",
              icon: Icons.people,
            ),
            SizedBox(width: 5.w),
            const MySoicalItem(
              text: "Friend Request",
              icon: Icons.people,
            ),
            SizedBox(width: 5.w),
            const MySoicalItem(
              text: "Search Players",
              icon: Icons.people,
            ),
          ],
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 9,
          itemBuilder: (context, i) {
            return const Card(
              child: ListTile(
                leading: CircleAvatar(
                    radius: 25,
                    foregroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGH-vLqWoKxeUdO_-j3FfRt_ickuQEG-QCUroW7k&s')),
                title: Text('Rustam'),
                subtitle: Text('Here is a second line'),
                trailing: Icon(Icons.more_vert),
              ),
            );
          },
        ),
      ],
    );
  }
}

class MySoicalItem extends StatelessWidget {
  const MySoicalItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(width: 5.w),
            Text(text),
          ],
        ),
      ),
    );
  }
}
