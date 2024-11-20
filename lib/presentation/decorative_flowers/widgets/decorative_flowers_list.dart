

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_task2/presentation/decorative_flowers/widgets/decorative_flower_item.dart';

class DecorativeFlowersList extends StatelessWidget {
  const DecorativeFlowersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        child: ListView.builder(
          itemCount: 15, // You can change this count based on your items
          itemBuilder: (context, index) {
            return const DecorativeFlowerItem();
          },
        ),
      ),
    );
  }
}
