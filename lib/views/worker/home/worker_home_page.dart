import 'package:flutter/material.dart';
import 'package:work_zone/utils/app_theme.dart';

class WorkerHomePage extends StatelessWidget {
  const WorkerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
        title: Text(
          'WorkZone',
          style: AppTheme.themeData.textTheme.headlineLarge!.copyWith(
            fontSize: 20,
            color: AppTheme.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: AppTheme.blackColor,
              ))
        ],
      ),
    );
  }
}
