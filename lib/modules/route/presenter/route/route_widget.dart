import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/core/constant/route_const.dart';
import 'package:muvver_app/modules/core/custom/custom_button.dart';
import 'package:muvver_app/modules/core/custom/custom_textfield.dart';
import 'package:muvver_app/modules/core/custom/custom_textfield_autocomplete.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';
import 'package:muvver_app/modules/route/domain/unities/city.dart';
import 'package:muvver_app/modules/route/presenter/route/route_store.dart';
import 'package:muvver_app/modules/route/presenter/route/route_text.dart';
import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';

class RouteWidget extends StatelessWidget {
  final Traveler traveler;
  final RouteStore store = RouteStore();

  RouteWidget({Key? key, required this.traveler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              children: [
                const SizedBox(height: 25),
                const Text(
                  RouteText.DESCRIPTION,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      controller: store.dateBeginController,
                      label: RouteText.DATE_BEGIN,
                      widthPercent: 43,
                      onTap: () =>
                          store.setDate(context, store.dateBeginController),
                    ),
                    CustomTextField(
                      controller: store.dateEndController,
                      label: RouteText.DATE_END,
                      widthPercent: 43,
                      onTap: () =>
                          store.setDate(context, store.dateEndController),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                CustomTextFieldAutoComplete<City>(
                  controller: store.cityOriginController,
                  label: RouteText.CITY_ORIGIN,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ColorTheme.SECOND,
                  ),
                  itemBuilder: (_, city) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(city.cityAndState()),
                      ),
                    );
                  },
                  onSuggestionSelected: (city) {
                    store.cityOrigin = city;
                    store.cityOriginController.text = city.cityAndState();
                  },
                  suggestionsCallback: store.setCities,
                ),
                const SizedBox(height: 25),
                CustomTextFieldAutoComplete<City>(
                  controller: store.cityDestinController,
                  label: RouteText.CITY_DESITIN,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ColorTheme.SECOND,
                  ),
                  itemBuilder: (_, city) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(city.cityAndState()),
                      ),
                    );
                  },
                  onSuggestionSelected: (city) {
                    store.cityDestin = city;
                    store.cityDestinController.text = city.cityAndState();
                  },
                  suggestionsCallback: store.setCities,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: ColorTheme.SECOND,
                      ),
                      onPressed: () {
                        Modular.to.pushNamed(RouteConst.MIDPOINT);
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Modular.to.pushNamed(RouteConst.MIDPOINT);
                      },
                      child: const Text(
                        RouteText.ADD_POINT,
                        style: TextStyle(
                          color: ColorText.PRIMARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    RouteText.CHANCE_MATCH,
                    style: TextStyle(color: ColorText.SECOND),
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomButton(
          title: RouteText.ADVANCE,
          onPressed: () {
            store.nextWidget(traveler);
          },
        ),
      ],
    );
  }
}
