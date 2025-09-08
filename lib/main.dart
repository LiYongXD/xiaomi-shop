import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
void main() {
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.black);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp( 
    ScreenUtilInit(
      designSize: const Size(1080, 2400),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) { 
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,  
          theme: ThemeData(
            primarySwatch: Colors.red
          ),
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          defaultTransition: Transition.rightToLeft,
        );
      },
    ),
  );
}
