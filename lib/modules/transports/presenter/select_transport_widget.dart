import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/core/constant/route_const.dart';
import 'package:muvver_app/modules/core/custom/custom_appbar.dart';
import 'package:muvver_app/modules/core/custom/custom_button.dart';
import 'package:muvver_app/modules/core/custom/custom_radio.dart';
import 'package:muvver_app/modules/core/styles/color_theme.dart';
import 'package:muvver_app/modules/transports/presenter/select_transport_text.dart';

import 'select_transport_store.dart';

class SelectTransportWidget extends StatefulWidget {
  const SelectTransportWidget({Key? key}) : super(key: key);

  @override
  State<SelectTransportWidget> createState() => _SelectTransportWidgetState();
}

class _SelectTransportWidgetState extends State<SelectTransportWidget> {
  final store = SelectTransportStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leading: IconButton(
          onPressed: () => Modular.to.navigate(RouteConst.HOME),
          icon: const Icon(
            Icons.close,
            color: ColorTheme.FOURTH,
          ),
          iconSize: 24,
        ),
        title: SelectTransportText.TITLE,
        message: SelectTransportText.MESSAGE,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              child: FutureBuilder<void>(
                  future: store.getTransports(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 60),
                      itemCount: store.transports.length,
                      itemBuilder: (_, index) {
                        final transport = store.transports[index];

                        return Observer(builder: (_) {
                          return CustomRadio(
                            pathImage: transport.pathImage,
                            nameImage: transport.name,
                            valueRadio: transport.id,
                            valueGroupRadio: store.valueRadio,
                            onChanged: store.setValueRadio,
                          );
                        });
                      },
                    );
                  }),
            ),
          ),
          CustomButton(
            title: SelectTransportText.BUTTON,
            onPressed: store.addTraveler,
          ),
        ],
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Text(
          SelectTransportText.SUB_TITLE,
          style: TextStyle(
            color: ColorText.PRIMARY,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
