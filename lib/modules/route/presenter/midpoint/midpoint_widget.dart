import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/core/custom/custom_appbar.dart';
import 'package:muvver_app/modules/core/custom/custom_button.dart';
import 'package:muvver_app/modules/core/custom/custom_textfield.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';
import 'package:muvver_app/modules/route/presenter/midpoint/midpoint_text.dart';

class MidpointWidget extends StatelessWidget {
  MidpointWidget({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final String originCity = "Grande - MS";
  final String destinCity = "Dourados - MS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "",
        message: "",
        leading: IconButton(
          onPressed: () => Modular.to.pop(),
          icon: const Icon(
            Icons.close,
            color: ColorTheme.FOURTH,
          ),
          iconSize: 24,
        ),
        height: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Stack(
          children: [
            ListView(
              children: [
                const Text(
                  MidpointText.TITLE,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    text: MidpointText.DESCRIPTION_PART_1,
                    style: TextStyle(fontSize: 16, color: ColorText.SECOND),
                    children: [
                      TextSpan(
                        text: MidpointText.DESCRIPTION_PART_2,
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorText.PRIMARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: MidpointText.DESCRIPTION_PART_3,
                        style: TextStyle(fontSize: 16, color: ColorText.SECOND),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  label: MidpointText.TEXT_FIELD_1,
                  controller: controller,
                  widthPercent: 100,
                ),
                const SizedBox(height: 15),
                Text(
                  MidpointText.subDescription(originCity, destinCity),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (_, int index) {
                    return Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: ColorTheme.FOURTH,
                          size: 34,
                        ),
                        Text(
                          "cidade",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            CustomButton(
              title: MidpointText.BUTTON,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
