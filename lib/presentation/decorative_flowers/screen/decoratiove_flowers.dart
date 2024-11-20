import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_task2/core/colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/decorative_flowers_list.dart'; // Import the correct CustomPainter file

class DecorativeFlowers extends StatelessWidget {//
  const DecorativeFlowers({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);

    return const Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: CustomAppBar(),
      body: DecorativeFlowersList(),
    );
  }
}