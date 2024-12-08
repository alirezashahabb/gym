// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "user_gym_vesam": "Vesam Club Users",
  "search_by_fullName": "Search by full name",
  "count_of_active_user": "Number of active users",
  "count_of_inactive_user": "Number of inactive users",
  "people": "{count} people",
  "active_user": "Active users",
  "expired_user": "Inactive users",
  "vesam_gym": "Vesam Cultural and Sports Club",
  "add_user": "Add user",
  "textfield_fullName": "Enter full name",
  "textfield_phone": "Please enter phone number",
  "textfield_registerDate": "Enter registration date",
  "textfield_endDate": "Enter subscription end date",
  "day_15": "15 days",
  "month_1": "Month 1",
  "month_3": "Month 3",
  "fullname": "Full name",
  "phone": "Phone number",
  "price": "Price",
  "register_date": "Registration date",
  "end_date": "Subscription end date",
  "yse": "Yes",
  "no": "No",
  "conform_delete": "Are you sure you want to delete this user?",
  "deleted_user": "Deleted user"
};
static const Map<String,dynamic> fa = {
  "user_gym_vesam": "کاربران باشگاه وسام",
  "search_by_fullName": "جستجو با نام خانوادگی",
  "count_of_active_user": "تعداد  کاربران فعال",
  "count_of_inactive_user": "تعداد  کاربران غیر فعال",
  "people": "{count}نفر",
  "active_user": "کاربران قعال",
  "expired_user": "کاربران غیر قعال",
  "vesam_gym": "یاشگاه فرهنگی ورزشی وسام",
  "add_user": "افزودن کاربر",
  "textfield_fullName": "نام و نام خانوادگی را وارد نمایید",
  "textfield_phone": "لطفا شماره تماس را وارد نمایید",
  "textfield_registerDate": "تاریخ ثبت نام وارد نمایید",
  "textfield_endDate": "تاریخ  پایان شهریه وارد نمایید",
  "day_15": "15 روز",
  "month_1": "ماه1",
  "month_3": "ماه 3",
  "fullname": "نام و نام خانوداگی",
  "phone": "شماره تماس",
  "price": "قیمت",
  "register_date": "تاریخ ثبت نام",
  "end_date": "تاریخ پایان شهریه",
  "yse": "بله",
  "no": "خیر",
  "conform_delete": "آیا از حذف این کاربر اطمینان دارید؟",
  "deleted_user": "حذف کاربر"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "fa": fa};
}
