import 'package:flutter_modular/flutter_modular.dart';
import 'package:muvver_app/modules/home/home_widget.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [];
  }

  @override
  List<ModularRoute> get routes {
    return [ChildRoute("/", child: (c, a) => const HomeWidget())];
  }
}
