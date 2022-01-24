import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar? tabBar;
  final IconButton? leading;
  final String title;
  final String message;
  final double height;
  List<Widget>? actions;
  CustomAppbar({
    Key? key,
    required this.title,
    required this.message,
    this.tabBar,
    this.leading,
    this.height = 151,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: ColorText.SECOND,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        flexibleSpace: Container(
          decoration: ColorTheme.linearGradient(),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Text(
              message,
              style: const TextStyle(
                color: ColorText.THIRD,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        bottom: tabBar,
        leading: leading,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
