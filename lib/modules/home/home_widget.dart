import 'package:flutter/material.dart';

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
          _button(),
          _button(),
        ],
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _appBar() {
    return Container(
      color: Colors.transparent,
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
    return Container(
      color: Colors.transparent,
      height: 15,
      child: Image.asset(
        "lib/images/logo/logo_2.png",
      ),
    );
  }

  Widget _profile() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 30,
            spreadRadius: -10,
            offset: Offset(-2, 5),
          )
        ],
      ),
      child: ClipRRect(
        child: Image.asset(
          "lib/images/home/profile.png",
          height: 35,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
    );
  }

  Widget _message() {
    return SizedBox(
      child: RichText(
        text: const TextSpan(
          text: "Facilitando seus ",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Titillium Web",
            fontSize: 20,
          ),
          children: [
            TextSpan(
              text: "envios.",
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
        "Entregue ou envie.",
        style: TextStyle(
          color: Colors.grey,
          fontFamily: "Titillium Web",
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black87),
        ),
        child: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_messageButton(), _image()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _messageButton() {
    return Column(
      children: const [
        SizedBox(height: 10),
        Center(
          child: Text(
            "Viajante",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Vai viajar pra onde?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _image() {
    return Image.asset("lib/images/home/box_1.png");
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      fixedColor: Colors.grey,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Início",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notificações",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.layers),
          label: "Pedidos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: "Entregas",
        )
      ],
    );
  }
}
