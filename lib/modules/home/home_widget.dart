import 'package:flutter/material.dart';
import 'package:muvver_app/modules/core/constant/image_const.dart';
import 'package:muvver_app/modules/core/constant/words_const.dart';
import 'package:muvver_app/modules/core/custom/custom_button.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';
import 'package:muvver_app/modules/home/home_text.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appBar(),
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

  Widget _appBar() {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _logo(),
            _profile(),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return SizedBox(
      height: 15,
      child: Image.asset(ImageConst.LOGO_1),
    );
  }

  Widget _profile() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: ColorTheme.PRIMARY,
            blurRadius: 30,
            spreadRadius: -10,
            offset: Offset(-2, 5),
          )
        ],
      ),
      child: ClipRRect(
        child: Image.asset(ImageConst.PROFILE, height: 35),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
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
      unselectedItemColor: ColorTheme.PRIMARY,
      fixedColor: ColorTheme.PRIMARY,
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
    return CustomButton(
      onPressed: () {},
      title: HomeText.BUTTON_TITLE_1,
      message: HomeText.BUTTON_TEXT_1,
      pathImage: ImageConst.BOX_1,
    );
  }

  Widget _button2() {
    return CustomButton(
      onPressed: () {},
      title: HomeText.BUTTON_TITLE_2,
      message: HomeText.BUTTON_TEXT_2,
      pathImage: ImageConst.TRUCK_1,
    );
  }
}
