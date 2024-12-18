import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_theme.dart';
import 'package:flutter_application_2/translations/locale_keys.g.dart';

class AddEditScreen extends StatefulWidget {
  const AddEditScreen({super.key});

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: themeData.colorScheme.onSecondary,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // logo
              const FlutterLogo(),
              const SizedBox(
                height: 16,
              ),
              //Title
              Text(
                LocaleKeys.vesam_gym.tr(),
                style: themeData.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              // add User
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FluentIcons.person_add_16_filled,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    LocaleKeys.add_user.tr(),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              //Text Felid
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: LocaleKeys.fullname.tr(),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: LocaleKeys.phone.tr(),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: LocaleKeys.price.tr(),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: LocaleKeys.register_date.tr(),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Icon(
                            FluentIcons.calendar_24_regular,
                          ),
                        ))),
              ),
              const SizedBox(
                height: 18,
              ),
              // RadioButton And Text

              Row(
                children: [
                  Radio(
                    activeColor: CustomColors.kPrimaryColor,
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  Text(
                    LocaleKeys.day_15.tr(),
                    style: themeData.textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Radio(
                    activeColor: CustomColors.kPrimaryColor,
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  Text(
                    LocaleKeys.month_1.tr(),
                    style: themeData.textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Radio(
                    activeColor: CustomColors.kPrimaryColor,
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  Text(
                    LocaleKeys.month_3.tr(),
                    style: themeData.textTheme.bodySmall,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              //End Date
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: LocaleKeys.end_date.tr(),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Icon(
                            FluentIcons.calendar_24_regular,
                          ),
                        ))),
              ),
              const SizedBox(
                height: 18,
              ),
              //Save Button
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.Save.tr(),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
