import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_task2/presentation/decorative_flowers/widgets/custom_painter_rps.dart';
import '../../../constants/assets.dart';

class DecorativeFlowerItem extends StatelessWidget {
  const DecorativeFlowerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35.w),
      ),
      margin: EdgeInsets.only(bottom: 20.h),
      child: Stack(
        children: [
          const FlowerIcon(),
          const FlowerImage(),
          Positioned(
            top: 20.h,
            left: 100.w,
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
            size: Size(45.w, 27.h),
            painter: RPSCustomPainter(),
          ),
          const Icon(
            Icons.lock,
            color: Colors.black,
            size: 12,
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
            5,
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
        6.verticalSpace,
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
        Container(
          height: 15.h,
          width: 20.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green[300],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(Icons.remove, size: 10.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            'x6', // Default quantity value
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
          ),
        ),
        Container(
          height: 15.h,
          width: 20.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green[300],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(Icons.add, size: 10.sp),
          ),
        ),
      ],
    );
  }
}
