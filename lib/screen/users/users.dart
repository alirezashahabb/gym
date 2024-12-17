import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_theme.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/translations/locale_keys.g.dart';

class UsersScreen extends StatelessWidget {
  final bool isActive;
  const UsersScreen({super.key, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeData.colorScheme.primary,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: CustomColors.kWhiteColor,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.vesam_gym.tr(),
                    style: themeData.textTheme.bodyMedium,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (context.locale == const Locale('en')) {
                      context.setLocale(const Locale('fa'));
                    } else {
                      context.setLocale(const Locale('en'));
                    }
                  },
                  icon: SizedBox(
                    width: 40,
                    height: 40,
                    child: context.locale == const Locale('en')
                        ? Assets.img.flagOfIranSvg.image()
                        : Assets.img.usaFalt.image(),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    isDarkTheme.value = !isDarkTheme.value;
                    await sharedPreferences.setBool(
                        'isDark', isDarkTheme.value);
                  },
                  icon: Icon(
                    isDarkTheme.value
                        ? FluentIcons.weather_sunny_16_filled
                        : FluentIcons.weather_moon_16_filled,
                    color: themeData.colorScheme.onSecondary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.refresh,
                    color: themeData.colorScheme.onSecondary,
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
