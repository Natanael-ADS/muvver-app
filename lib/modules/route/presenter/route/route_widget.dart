import 'package:flutter/material.dart';
import 'package:muvver_app/modules/core/custom/custom_button.dart';
import 'package:muvver_app/modules/core/custom/custom_textfield.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';
import 'package:muvver_app/modules/core/util/datetime_util.dart';
import 'package:muvver_app/modules/route/presenter/route/route_text.dart';

class RouteWidget extends StatelessWidget {
  RouteWidget({Key? key}) : super(key: key);
  TextEditingController dateBeginController = TextEditingController();
  TextEditingController dateEndController = TextEditingController();
  TextEditingController cityOriginController = TextEditingController();
  TextEditingController cityDestinController = TextEditingController();

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
                CustomTextField(
                  controller: cityOriginController,
                  label: RouteText.CITY_ORIGIN,
                  widthPercent: 100,
                  prefixIcon:
                      const Icon(Icons.search, color: ColorTheme.SECOND),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  controller: cityDestinController,
                  label: RouteText.CITY_DESITIN,
                  widthPercent: 100,
                  prefixIcon:
                      const Icon(Icons.search, color: ColorTheme.SECOND),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_circle_outline, color: ColorTheme.SECOND),
                    SizedBox(width: 10),
                    Text(
                      RouteText.ADD_POINT,
                      style: TextStyle(
                        color: ColorText.PRIMARY,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
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
        CustomButton(title: RouteText.ADVANDER, onPressed: () {}),
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
