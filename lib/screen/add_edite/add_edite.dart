import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/constant/app_constant.dart';
import 'package:flutter_application_2/constant/color_theme.dart';
import 'package:flutter_application_2/model/user_model.dart';
import 'package:flutter_application_2/translations/locale_keys.g.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class AddEditScreen extends StatefulWidget {
  final User user;
  const AddEditScreen({
    super.key,
    required this.user,
  });

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  Jalali? register;
  Jalali? endDate;

  ValueNotifier<int> registerType = ValueNotifier(1);

  final formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController registerDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  var box = Hive.box<User>(AppConstant.userBox);
  @override
  void initState() {
    if (widget.user.isInBox) {
      fullNameController.text = widget.user.fullName!;
      phoneController.text = widget.user.phone!;
      priceController.text = widget.user.price.toString();
      registerDateController.text = widget.user.registerData!;
      endDateController.text = widget.user.endDate!;
      registerType.value = widget.user.registerType!;
    }
    super.initState();
  }

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
          child: Form(
            key: formKey,
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
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.textfield_fullName.tr();
                    }
                    return null;
                  },
                  controller: fullNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.fullname.tr(),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.textfield_phone.tr();
                    }
                    return null;
                  },
                  controller: phoneController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.phone.tr(),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),

                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.textfield_price.tr();
                    }
                    return null;
                  },
                  controller: priceController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.price.tr(),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.textfield_registerDate.tr();
                    }
                    return null;
                  },
                  controller: registerDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: LocaleKeys.register_date.tr(),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            register = await showPersianDatePicker(
                              context: context,
                              initialDate: Jalali.now(),
                              firstDate: Jalali(1385, 8),
                              lastDate: Jalali(1450, 9),
                            );
                            registerDateController.text =
                                register?.formatCompactDate() ?? '';

                            switch (registerType.value) {
                              case 1:
                                endDate = register?.addDays(15);
                                break;
                              case 2:
                                endDate = register?.addMonths(1);
                                break;
                              case 3:
                                endDate = register?.addMonths(3);
                                break;
                            }
                            endDateController.text =
                                endDate?.formatCompactDate() ?? '';
                          },
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
                ValueListenableBuilder(
                  valueListenable: registerType,
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        Radio(
                          activeColor: CustomColors.kPrimaryColor,
                          value: 1,
                          groupValue: registerType.value,
                          onChanged: (value) {
                            registerType.value = 1;
                            endDate = register?.addDays(15);
                            endDateController.text =
                                endDate?.formatCompactDate() ?? '';
                          },
                        ),
                        Text(
                          LocaleKeys.day_15.tr(),
                          style: themeData.textTheme.bodySmall,
                        ),
                        const Spacer(),
                        Radio(
                          activeColor: CustomColors.kPrimaryColor,
                          value: 2,
                          groupValue: registerType.value,
                          onChanged: (value) {
                            registerType.value = 2;
                            endDate = register?.addMonths(1);
                            endDateController.text =
                                endDate?.formatCompactDate() ?? '';
                          },
                        ),
                        Text(
                          LocaleKeys.month_1.tr(),
                          style: themeData.textTheme.bodySmall,
                        ),
                        const Spacer(),
                        Radio(
                          activeColor: CustomColors.kPrimaryColor,
                          value: 3,
                          groupValue: registerType.value,
                          onChanged: (value) {
                            registerType.value = 3;
                            endDate = register?.addMonths(3);
                            endDateController.text =
                                endDate?.formatCompactDate() ?? '';
                          },
                        ),
                        Text(
                          LocaleKeys.month_3.tr(),
                          style: themeData.textTheme.bodySmall,
                        ),
                        const Spacer(),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                //End Date
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocaleKeys.textfield_endDate.tr();
                    }
                    return null;
                  },
                  controller: endDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: LocaleKeys.end_date.tr(),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            endDate = await showPersianDatePicker(
                              context: context,
                              initialDate: Jalali.now(),
                              firstDate: Jalali(1385, 8),
                              lastDate: Jalali(1450, 9),
                            );
                            endDateController.text =
                                endDate?.formatCompactDate() ?? '';
                          },
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          widget.user.fullName = fullNameController.text;
                          widget.user.phone = phoneController.text;
                          widget.user.price = int.parse(priceController.text);
                          widget.user.registerData =
                              registerDateController.text;
                          widget.user.endDate = endDateController.text;
                          widget.user.registerType = registerType.value;
                          if (widget.user.isInBox) {
                            widget.user.save();
                          } else {
                            await box.add(widget.user);
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        LocaleKeys.Save.tr(),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
