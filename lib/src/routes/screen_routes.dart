import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/views/pages/achievements/achievements_list.dart';
import 'package:fytnez_mobile/src/views/pages/diet/diet_page.dart';
import 'package:fytnez_mobile/src/views/pages/home_page.dart';
import 'package:fytnez_mobile/src/views/pages/login_page.dart';
import 'package:fytnez_mobile/src/views/pages/profile/profile_page.dart';
import 'package:fytnez_mobile/src/views/pages/user/user_form/user_form_data.dart';
import 'package:fytnez_mobile/src/views/pages/user/user_form/user_form_page.dart';

Map<String, Widget Function(BuildContext)> screenRoutes = {
  Login.getRouteName(): (context) => const Login(),
  Home.getRouteName(): (context) => const Home(),
  UserFormPage.getRouteName(): (context) => const UserFormPage(),
  AchievementsList.getRouteName(): (context) => const AchievementsList(),
  ProfilePage.getRouteName(): (context) =>
      ProfilePage(userFormData: UserFormData()),
  DietPage.getRouteName(): (context) => const DietPage(),
};
