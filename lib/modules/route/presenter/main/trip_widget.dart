import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/core/constant/route_const.dart';
import 'package:muvver_app/modules/core/custom/custom_appbar.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';
import 'package:muvver_app/modules/route/presenter/main/trip_text.dart';
import 'package:muvver_app/modules/route/presenter/map/map_widget.dart';
import 'package:muvver_app/modules/route/presenter/route/route_widget.dart';
import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';

class TripWidget extends StatelessWidget {
  final Traveler traveler;
  const TripWidget({Key? key, required this.traveler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppbar(
          message: TripText.SUBTITLE,
          title: TripText.TITLE,
          height: 173,
          tabBar: const TabBar(
            indicatorColor: ColorText.THIRD,
            tabs: [
              Tab(text: TripText.TAB_ROUTE),
              Tab(text: TripText.TAB_MAP),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  Modular.to.navigate(RouteConst.HOME);
                },
                child: const Text(
                  TripText.CANCEL,
                  style: TextStyle(color: ColorText.THIRD, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            RouteWidget(traveler: traveler),
            const MapWidget(),
          ],
        ),
      ),
    );
  }
}
