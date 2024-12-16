import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_theme.dart';
import 'package:flutter_application_2/translations/locale_keys.g.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            color: themeData.colorScheme.secondary,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: curentIndex == 0
                            ? themeData.colorScheme.onSecondary
                            : Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: curentIndex == 1
                            ? themeData.colorScheme.onSecondary
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 75,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              curentIndex = 0;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FluentIcons.person_12_filled,
                                color: curentIndex == 0
                                    ? themeData.colorScheme.onSecondary
                                    : CustomColors.kLightGreyColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                LocaleKeys.active_user.tr(),
                                style: curentIndex == 0
                                    ? themeData.textTheme.bodyMedium
                                    : themeData.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 75,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              curentIndex = 1;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FluentIcons.calendar_24_regular,
                                color: curentIndex == 1
                                    ? themeData.colorScheme.onSecondary
                                    : CustomColors.kLightGreyColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                LocaleKeys.expired_user.tr(),
                                style: curentIndex == 1
                                    ? themeData.textTheme.bodyMedium
                                    : themeData.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
