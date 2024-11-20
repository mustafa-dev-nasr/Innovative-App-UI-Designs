import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_task2/presentation/decorative_flowers/screen/decoratiove_flowers.dart';


class AppUiDesign extends StatelessWidget {

  const AppUiDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          ),
          
          title: 'Decorative Flowers',
          home: const DecorativeFlowers(),
          // initialRoute:
          //     isLoggedIn ? Routes.homeScreen : Routes.onBoardingScreen,
        );
      },
    );
  }
}
