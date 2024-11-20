import 'package:flutter/material.dart';

// CustomPainter لرسم الخلفية
class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blueAccent;

    // رسم دائرة كبيرة
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.3), // مكان الدائرة
      size.width * 0.4, // حجم الدائرة
      paint,
    );

    // تغيير اللون لرسم شكل آخر
    paint.color = Colors.lightBlueAccent;

    // رسم مسار Bezier لتكوين شكل مثل الموجة
    Path path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.5, // نقطة التحكم في المسار
      size.height * 0.9, // نقطة التحكم الثانية
      size.width, // نهاية المسار
      size.height * 0.7, // نهاية المسار
    );
    path.lineTo(size.width, size.height); // رسم خط للأسفل
    path.lineTo(0, size.height); // العودة للنقطة الأولى
    path.close();

    // رسم المسار
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // لا يتم إعادة الرسم إلا إذا تغير شيء في الواجهة
  }
}

// الكلاس الخاص برسم الشكل باستخدام CustomPainter
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1 - Filling the shape
    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255) // White color
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.02 // Example stroke width
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3808333, size.height * 0.3383333);
    path_0.lineTo(size.width * 0.3966667, size.height * 0.4300000);
    path_0.lineTo(size.width * 0.4958333, size.height * 0.5283333);
    path_0.lineTo(size.width * 0.5191667, size.height * 0.4533333);
    path_0.lineTo(size.width * 0.5008333, size.height * 0.3600000);
    path_0.lineTo(size.width * 0.4458333, size.height * 0.2850000);
    path_0.close(); // Close the path to create a closed shape

    canvas.drawPath(path_0, paintFill0); // Fill the path with white color

    // Layer 1 - Stroke
    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243) // Blue color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02 // Adjust stroke width
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0); // Draw the stroke with blue color
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint the canvas when necessary
  }
}

// واجهة المستخدم التي تستخدم CustomPaint
class CustomPaintExample extends StatelessWidget {
  const CustomPaintExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // تحديد لون الخلفية
      body: Stack(
        children: [
          // استخدام RPSCustomPainter
          CustomPaint(
            size: MediaQuery.of(context).size, // ملء الشاشة بالكامل
            painter: BackgroundPainter(), // تطبيق CustomPainter
          ),
          // محتوى الصفحة (النص في المنتصف)
          const Center(
            child: Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white, // نص باللون الأبيض
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomPaintExample(), // تحديد الشاشة الرئيسية
    );
  }
}
