import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../styles/styles.dart';
import 'ui.dart';



class SettingsService extends GetxService {
  late GetStorage _box;

  // late SettingRepository _settingsRepo;

  // SettingsService() {
  //   _settingsRepo = new SettingRepository();
  //   _box = new GetStorage();
  // }

  // Future<SettingsService> init() async {
  //   address.listen((Address _address) {
  //     _box.write('current_address', _address.toJson());
  //   });
  //   setting.value = await _settingsRepo.get();
  //   setting.value.modules = await _settingsRepo.getModules();
  //   return this;
  // }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0, backgroundColor: Colors.white),
        brightness: Brightness.light,
        dividerColor: Colors.grey.shade200,
        focusColor: Colors.black12,
        hintColor: Colors.orange,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Colors.white),
        ),
        colorScheme: ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.white,
        ));
        // textTheme: GoogleFonts.getTextTheme('Poppins',
        //   TextTheme(
        //     headline6: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.white, height: 1.2),
        //     headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.orange, height: 1.2),
        //     headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.orange, height: 1.3),
        //     headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.orange, height: 1.3),
        //     headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Colors.white, height: 1.4),
        //     headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Colors.orange, height: 1.4),
        //     subtitle2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.orange, height: 1.2),
        //     subtitle1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Colors.white, height: 1.2),
        //     bodyText2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Colors.orange, height: 1.2),
        //     bodyText1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.orange, height: 1.2),
        //     caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Colors.black12, height: 1.2),
        //   ),
        // ));
  }

  ThemeData getDarkTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: Color(0xFF252525),
        floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: Color(0xFF2C2C2C),
        brightness: Brightness.dark,
        dividerColor: Colors.orange,
        focusColor: Colors.orange,
        hintColor: Colors.black,
        toggleableActiveColor: Colors.black12,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Colors.white),
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.black12,
          secondary: Colors.black12,
        ));
        // textTheme: GoogleFonts.getTextTheme(
        //      'Poppins',
        //     TextTheme(
        //       headline6: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Colors.black12, height: 1.2),
        //       headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black, height: 1.2),
        //       headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black, height: 1.3),
        //       headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black, height: 1.3),
        //       headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Colors.black12, height: 1.4),
        //       headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Colors.black, height: 1.4),
        //       subtitle2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.black, height: 1.2),
        //       subtitle1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Colors.black12, height: 1.2),
        //       bodyText2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Colors.black, height: 1.2),
        //       bodyText1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black, height: 1.2),
        //       caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Colors.orange, height: 1.2),
        //     )));
  }



  ThemeMode getThemeMode() {
    String? _themeMode = GetStorage().read<String>('theme_mode');
    switch (_themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        // if (defaultTheme == "dark") {
        //   SystemChrome.setSystemUIOverlayStyle(
        //     SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
        //   );
        //   return ThemeMode.dark;
        // } else {

          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
          );
          return ThemeMode.light;

        // }
    }
  }
}
