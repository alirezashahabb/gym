import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/app_constant.dart';
import 'package:flutter_application_2/constant/color_theme.dart';
import 'package:flutter_application_2/model/user_model.dart';
import 'package:flutter_application_2/screen/root/root_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
ValueNotifier<bool> isDarkTheme = ValueNotifier(false);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  isDarkTheme.value = sharedPreferences.getBool('isDark') ?? false;
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>(AppConstant.userBox);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fa'),
      ],
      path: 'assets/translations',
      startLocale: const Locale('fa'),
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkTheme,
      builder: (context, value, child) {
        return MaterialApp(
          theme: lightTheme(
              context.locale == const Locale('fa') ? 'Vazir' : 'Gilroy'),
          darkTheme: darkTheme(
              context.locale == const Locale('fa') ? 'Vazir' : 'Gilroy'),
          themeMode: isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
          home: const RootScreen(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
