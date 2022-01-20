import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muvver',
      theme: ThemeData(primarySwatch: ColorTheme.PRIMARY),
    ).modular();
  }
}
