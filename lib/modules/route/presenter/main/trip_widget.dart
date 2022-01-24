import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/core/constant/route_const.dart';
import 'package:muvver_app/modules/core/custom/custom_appbar.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';
import 'package:muvver_app/modules/route/presenter/map/map_widget.dart';
import 'package:muvver_app/modules/route/presenter/route/route_widget.dart';

class TripWidget extends StatelessWidget {
  final int idTraveler;
  const TripWidget({Key? key, required this.idTraveler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppbar(
          message: "Qual o trajeto da sua viagem?",
          title: "Viajante",
          height: 173,
          tabBar: const TabBar(indicatorColor: ColorText.THIRD, tabs: [
            Tab(text: "Rotas"),
            Tab(text: "Mapa"),
          ]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  Modular.to.navigate(RouteConst.HOME);
                },
                child: const Text(
                  "Cancelar",
                  style: TextStyle(color: ColorText.THIRD, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        body: const TabBarView(
          children: [RouteWidget(), MapWidget()],
        ),
      ),
    );
  }
}
