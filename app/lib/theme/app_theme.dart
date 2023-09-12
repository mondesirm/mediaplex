import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    labelSmall: GoogleFonts.urbanist(fontSize: 5.sp, fontWeight: FontWeight.w700), // 5
    bodySmall: GoogleFonts.urbanist(fontSize: 5.sp, fontWeight: FontWeight.w700), // 5
    bodyMedium: GoogleFonts.urbanist(fontSize: 5.sp, fontWeight: FontWeight.w700), // 5
    bodyLarge: GoogleFonts.urbanist(fontSize: 5.sp, fontWeight: FontWeight.w700), // 5
    titleLarge: GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w700), // 10
    headlineSmall: GoogleFonts.urbanist(fontSize: 20.sp, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.urbanist(fontSize: 24.sp, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.urbanist(fontSize: 32.sp, fontWeight: FontWeight.w700),
    displayMedium: GoogleFonts.urbanist(fontSize: 40.sp, fontWeight: FontWeight.w700),
    displayLarge: GoogleFonts.urbanist(fontSize: 48.sp, fontWeight: FontWeight.w700)
  );

  static ThemeData lightMode = ThemeData(
    textTheme: textTheme,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: AppColors.white, iconTheme: IconThemeData(color: AppColors.grey900)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.white,
      selectedLabelStyle: GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w700),
      unselectedLabelStyle: GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w500)
    )
  );

  static ThemeData darkMode = ThemeData(
    textTheme: textTheme,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.dark1,
    appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: AppColors.dark1, iconTheme: IconThemeData(color: AppColors.white)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: const Color(0xff181A20).withOpacity(.8),
      selectedLabelStyle: GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w700),
      unselectedLabelStyle: GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w500)
    )
  );
}

class AppDynamicColorBuilder {
  static bool isDarkMode = false;

  static Color getWhiteAndDark2(BuildContext context) => isDarkMode ? AppColors.dark2 : AppColors.white;
  static Color getDark2AndGrey50(BuildContext context) => isDarkMode ? AppColors.dark2 : AppColors.grey50;
  static Color getDark3AndGrey200(BuildContext context) => isDarkMode ? AppColors.dark3 : AppColors.grey200;
  static Color getGrey100AndDark2(BuildContext context) => isDarkMode ? AppColors.dark2 : AppColors.grey100;
  static Color getGrey800AndWhite(BuildContext context) => isDarkMode ? AppColors.white : AppColors.grey800;
  static Color getGrey900AndWhite(BuildContext context) => isDarkMode ? AppColors.white : AppColors.grey900;
  static Color getPrimaryAndWhite(BuildContext context) => isDarkMode ? AppColors.white : AppColors.primary;
  static Color getGrey600AndGrey400(BuildContext context) => isDarkMode ? AppColors.grey600 : AppColors.grey400;
  static Color getGrey700AndGrey300(BuildContext context) => isDarkMode ? AppColors.grey300 : AppColors.grey700;
  static Color getGrey800AndGrey300(BuildContext context) => isDarkMode ? AppColors.grey300 : AppColors.grey800;
  static Color getPrimary100AndDark3(BuildContext context) => isDarkMode ? AppColors.dark3 : AppColors.primary.withOpacity(.2);
}