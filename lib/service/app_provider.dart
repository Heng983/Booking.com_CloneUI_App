import 'package:flutter/material.dart';
import 'package:hotel_app/apps_logic.dart';
import 'package:provider/provider.dart';
import 'package:hotel_app/Theme_logic.dart';

Widget app_provider() {
  return MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ThemeLogic())],
    child: Apps(),
  );
}
