import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/core/constant/route_const.dart';
import 'package:muvver_app/modules/core/custom/custom_button.dart';
import 'package:muvver_app/modules/core/custom/custom_textfield.dart';
import 'package:muvver_app/modules/core/custom/custom_textfield_autocomplete.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';
import 'package:muvver_app/modules/core/util/datetime_util.dart';
import 'package:muvver_app/modules/route/domain/unities/city.dart';
import 'package:muvver_app/modules/route/presenter/route/route_text.dart';

class RouteWidget extends StatelessWidget {
  RouteWidget({Key? key}) : super(key: key);
  final TextEditingController dateBeginController = TextEditingController();
  final TextEditingController dateEndController = TextEditingController();
  final TextEditingController cityOriginController = TextEditingController();
  final TextEditingController cityDestinController = TextEditingController();

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
                      controller: dateBeginController,
                      label: RouteText.DATE_BEGIN,
                      widthPercent: 43,
                      onTap: () => _setDate(context, dateBeginController),
                    ),
                    CustomTextField(
                      controller: dateEndController,
                      label: RouteText.DATE_END,
                      widthPercent: 43,
                      onTap: () => _setDate(context, dateEndController),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                CustomTextFieldAutoComplete<City>(
                  controller: cityOriginController,
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
                    cityOriginController.text = city.cityAndState();
                  },
                  suggestionsCallback: (text) {
                    return [
                      City(id: "1", name: "teste", stateAbbreviation: "TT"),
                      City(id: "2", name: "outro", stateAbbreviation: "OO")
                    ];
                  },
                ),
                const SizedBox(height: 25),
                CustomTextFieldAutoComplete<City>(
                  controller: cityDestinController,
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
                    cityOriginController.text = city.cityAndState();
                  },
                  suggestionsCallback: (text) {
                    return [
                      City(id: "1", name: "teste", stateAbbreviation: "TT"),
                      City(id: "2", name: "outro", stateAbbreviation: "OO")
                    ];
                  },
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
        CustomButton(title: RouteText.ADVANCE, onPressed: () {}),
      ],
    );
  }

  _setDate(BuildContext context, TextEditingController controller) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2999),
    );
    controller.text = DatetimeUtil.getStringFromDate(date);
  }
}
