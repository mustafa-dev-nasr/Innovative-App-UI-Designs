

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_task2/presentation/decorative_flowers/widgets/custom_painter_rps.dart';

import '../../../constants/assets.dart';

class DecorativeFlowerItem extends StatelessWidget {
  const DecorativeFlowerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
      margin: EdgeInsets.only(bottom: 20.h),
      child: Stack(
        children: [
          const FlowerIcon(),
          const FlowerImage(),
          Positioned(
            top: 20.h,
            left: 80.w,
            right: 50.w,
            child: const FlowerDetails(),
          ),
        ],
      ),
    );
  }
}

class FlowerIcon extends StatelessWidget {
  const FlowerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(36.w, 27.h),
            painter: RPSCustomPainter(),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.lock,
              color: Colors.black,
              size: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class FlowerImage extends StatelessWidget {
  const FlowerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        child: Image.asset(
          Assets.assetsSvgsPlants, // Path to the image
          height: 85.h,
          width: 80.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FlowerDetails extends StatelessWidget {
  const FlowerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(
            5, // Rating is fixed to 5 stars
            (index) => Icon(
              Icons.star,
              color: Colors.amber,
              size: 10.sp,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Decorative Flowers', // Fixed title
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '\$20.00', // Fixed price
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        const QuantityControl(),
      ],
    );
  }
}

class QuantityControl extends StatelessWidget {
  const QuantityControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            // Action for decrement
          },
          icon: Icon(Icons.remove, size: 10.sp),
        ),
        Text(
          '1', // Default quantity value
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8.sp),
        ),
        IconButton(
          onPressed: () {
            // Action for increment
          },
          icon: Icon(
            Icons.add,
            size: 10.sp,
          ),
        ),
      ],
    );
  }
}
