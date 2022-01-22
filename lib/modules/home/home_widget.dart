import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/core/constant/image_const.dart';
import 'package:muvver_app/modules/core/constant/route_const.dart';
import 'package:muvver_app/modules/core/constant/words_const.dart';
import 'package:muvver_app/modules/core/custom/custom_button_with_image.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';

import 'home_text.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorTheme.THIRD,
        ),
        backgroundColor: ColorTheme.THIRD,
        actions: [_profile()],
        leading: _logo(),
        elevation: 0,
        leadingWidth: 100,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          _message(),
          const SizedBox(height: 20),
          _submessage(),
          _button1(),
          _button2(),
        ],
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _logo() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Image.asset(ImageConst.LOGO_2, height: 35, width: 80),
      ),
    );
  }

  Widget _profile() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: ColorTheme.PRIMARY,
            blurRadius: 30,
            spreadRadius: -19,
            offset: Offset(-2, 5),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: ClipRRect(
          child: Image.asset(ImageConst.PROFILE, height: 32, width: 32),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
      ),
    );
  }

  Widget _message() {
    return SizedBox(
      child: RichText(
        text: const TextSpan(
          text: HomeText.MESSAGE_1,
          style: TextStyle(
            color: ColorText.PRIMARY,
            fontSize: 20,
          ),
          children: [
            TextSpan(
              text: HomeText.MESSAGE_2,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _submessage() {
    return const SizedBox(
      child: Text(
        HomeText.SUBMESSAGE,
        style: TextStyle(
          color: ColorText.SECOND,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: ColorTheme.FOURTH,
      fixedColor: ColorTheme.FOURTH,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: WordsConst.HOME,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: WordsConst.NOTIFICATIONS,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: WordsConst.CHAT,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.layers),
          label: WordsConst.ORDERS,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: WordsConst.DELIVERIES,
        )
      ],
    );
  }

  Widget _button1() {
    return CustomButtonWithImage(
      onPressed: () {},
      title: HomeText.BUTTON_TITLE_1,
      message: HomeText.BUTTON_TEXT_1,
      pathImage: ImageConst.BOX_2,
    );
  }

  Widget _button2() {
    return CustomButtonWithImage(
      onPressed: () {
        Modular.to.navigate(RouterConst.SELECT_TRANSPORT);
      },
      title: HomeText.BUTTON_TITLE_2,
      message: HomeText.BUTTON_TEXT_2,
      pathImage: ImageConst.TRUCK_2,
    );
  }
}
