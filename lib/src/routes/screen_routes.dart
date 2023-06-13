import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/views/pages/home_page.dart';
import 'package:fytnez_mobile/src/views/pages/login_page.dart';

Map<String, Widget Function(BuildContext)> screenRoutes = {
  Login.getRouteName(): (context) => const Login(),
};
