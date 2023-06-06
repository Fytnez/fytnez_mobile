import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/views/pages/home_page.dart';
import 'package:fytnez_mobile/src/views/pages/user/user_form/user_form_page.dart';

Map<String, Widget Function(BuildContext)> screenRoutes = {
  // Home.getRouteName(): (context) => const Home(title: 'Flutter Demo Home Page'),
  UserFormPage.getRouteName(): (context) => const UserFormPage(),
};
