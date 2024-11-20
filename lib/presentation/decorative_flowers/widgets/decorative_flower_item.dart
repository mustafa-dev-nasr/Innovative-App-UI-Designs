import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/assets.dart';
import '../../second_screen/second_screen.dart';
import 'custom_painter_rps.dart';

class DecorativeFlowerItem extends StatefulWidget {
  const DecorativeFlowerItem({super.key});

  @override
  State<DecorativeFlowerItem> createState() => _DecorativeFlowerItemState();
}

class _DecorativeFlowerItemState extends State<DecorativeFlowerItem> {
  bool _isImageExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isImageExpanded = !_isImageExpanded;
        });

        if (_isImageExpanded) {
          Future.delayed(const Duration(milliseconds: 300), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const SecondScreen(), // استبدل بـ شاشتك الثانية
              ),
            );
            setState(() {
              _isImageExpanded = false;
            });
          });
        }
      },
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 110.h,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35.w),
                ),
                margin: EdgeInsets.only(bottom: 20.h),
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.centerRight, child: FlowerIcon()),
                    Positioned(
                      top: 20.h,
                      left: 100.w,
                      right: 50.w,
                      child: const FlowerDetails(),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(microseconds: 1),
                bottom: _isImageExpanded ? -50.w : 20.w,
                top: 10.h,
                child: FlowerImage(
                  isImageExpanded: _isImageExpanded,
                ),
              ),
            ],
          ),
          _isImageExpanded
              ? SizedBox(
                  height: 80.h,
                )
              : const SizedBox(),
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
  const FlowerImage({super.key, required this.isImageExpanded});
  final bool isImageExpanded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        Assets.assetsSvgsPlants,
        height: isImageExpanded ? 100.h : 85.h,
        width: isImageExpanded ? 150.w : 80.w,
        fit: BoxFit.cover,
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
          'Decorative Flowers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '\$20.00',
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.h),
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
            'x6',
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

class DecorativeFlowersList extends StatelessWidget {
  const DecorativeFlowersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return const DecorativeFlowerItem();
          },
        ),
      ),
    );
  }
}
