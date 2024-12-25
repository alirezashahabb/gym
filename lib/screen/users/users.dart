import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/app_constant.dart';
import 'package:flutter_application_2/constant/color_theme.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/model/user_model.dart';
import 'package:flutter_application_2/screen/add_edite/add_edite.dart';
import 'package:flutter_application_2/translations/locale_keys.g.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UsersScreen extends StatelessWidget {
  final bool isActive;

  const UsersScreen({super.key, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    var box = Hive.box<User>(AppConstant.userBox);
    ValueNotifier<String> searchNotifier = ValueNotifier('');
// this function for chaeck users is Active or no
    List<User> getUser() {
      List<User> userList = [];
      for (var element in box.values) {
        var jalaliDate1 = Jalali.now().toDateTime();
        int endDateYear = int.parse(element.endDate!.split('/')[0]);
        int endDateMonth = int.parse(element.endDate!.split('/')[1]);
        int endDateDay = int.parse(element.endDate!.split('/')[2]);
        var jaladate2 =
            Jalali(endDateYear, endDateMonth, endDateDay).toDateTime();
        if (isActive) {
          if (jaladate2.isAfter(jalaliDate1)) {
            userList.add(element);
          }
        } else {
          if (!jaladate2.isAfter(jalaliDate1)) {
            userList.add(element);
          }
        }
      }
      return userList;
    }

    return Scaffold(
      floatingActionButton: isActive
          ? FloatingActionButton(
              backgroundColor: themeData.colorScheme.primary,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return AddEditScreen(
                      user: User(
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                      ),
                    );
                  },
                ));
              },
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
              onChanged: (value) {
                searchNotifier.value = value;
              },
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
            ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, value, child) {
                return Container(
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
                          namedArgs: {
                            "count": getUser().length.toString(),
                          },
                        ),
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          color: CustomColors.kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            //for ListView Builder
            Expanded(
                child: ValueListenableBuilder(
              valueListenable: searchNotifier,
              builder: (context, value, child) {
                return ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (context, value, child) {
                    // for search by Name
                    List<User> users = getUser();

                    if (searchNotifier.value.isEmpty) {
                      users = getUser();
                    } else {
                      users = users
                          .where(
                            (element) => element.fullName!
                                .toLowerCase()
                                .contains(searchNotifier.value.toLowerCase()),
                          )
                          .toList();
                    }
                    return users.isNotEmpty
                        ? ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              var items = users[index];
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: themeData.colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(items.fullName!),
                                    ),
                                    Expanded(
                                      child: Text(items.registerData!),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              AddEditScreen(user: items),
                                        ));
                                      },
                                      icon: const Icon(
                                          FluentIcons.edit_24_regular),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.confirm,
                                          title: LocaleKeys.conform_delete.tr(),
                                          confirmBtnText: LocaleKeys.yse.tr(),
                                          cancelBtnText: LocaleKeys.no.tr(),
                                          confirmBtnColor: Colors.green,
                                          onConfirmBtnTap: () async {
                                            await items.delete();
                                            Navigator.pop(context);
                                          },
                                          onCancelBtnTap: () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                          FluentIcons.delete_12_filled),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Assets.img.emptyPana.image(
                            width: 200,
                            height: 200,
                          );
                  },
                );
              },
            )),
          ],
        ),
      )),
    );
  }
}
