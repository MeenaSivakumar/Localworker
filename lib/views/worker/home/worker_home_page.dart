import 'package:flutter/material.dart';
import 'package:work_zone/utils/app_theme.dart';

class WorkerHomePage extends StatelessWidget {
  const WorkerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Adjust height as needed
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF037AA8), // Use your app bar color
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0), // Rounded corners
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/user_profile.svg'),
                      radius: 25.0,
                    ),
                  ),
                  SizedBox(width: 10.0),],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
