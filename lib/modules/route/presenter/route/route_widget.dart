import 'package:flutter/material.dart';

class RouteWidget extends StatelessWidget {
  const RouteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(child: Text("ROUTE")),
    );
  }
}
