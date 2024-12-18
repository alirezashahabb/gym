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
      floatingActionButton: isActive
          ? FloatingActionButton(
              backgroundColor: themeData.colorScheme.primary,
              onPressed: () {},
              child: const Icon(
                Icons.add,
                color: CustomColors.kWhiteColor,
              ),
            )
          : null,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            // for light and dark them so locale
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
            ),

            // for search text field
            TextField(
              decoration: InputDecoration(
                fillColor: themeData.colorScheme.tertiary,
                filled: true,
                hintText: LocaleKeys.search_by_fullName.tr(),
                hintStyle: themeData.textTheme.bodyMedium,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // for Active and DeActive Users
            Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isActive
                    ? CustomColors.kGreenColor
                    : CustomColors.kRedColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isActive
                        ? LocaleKeys.count_of_active_user.tr()
                        : LocaleKeys.count_of_inactive_user.tr(),
                    style: themeData.textTheme.bodyMedium!.copyWith(
                      color: CustomColors.kWhiteColor,
                    ),
                  ),
                  Text(
                    LocaleKeys.people.tr(
                      namedArgs: {"count": "14"},
                    ),
                    style: themeData.textTheme.bodyMedium!.copyWith(
                      color: CustomColors.kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            //for ListView Builder
            Expanded(
                child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      const Expanded(child: Text('alireza')),
                      const Expanded(child: Text('1403/12/5')),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FluentIcons.edit_24_regular),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FluentIcons.delete_12_filled),
                      ),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      )),
    );
  }
}
