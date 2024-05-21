
import 'package:appjamai/Screens/GalleryScreen.dart';
import 'package:appjamai/Screens/homeScreen.dart';
import 'package:appjamai/Screens/profilScreen.dart';
import 'package:flutter/cupertino.dart';

import 'Screens/loginScreen.dart';

Map<String,WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  GalleryScreen.routeName:(context) => GalleryScreen(),
  ProfilScreen.routeName:(context) => ProfilScreen(),
};