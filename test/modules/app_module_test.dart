import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muvver_app/modules/app_module.dart';
import 'package:modular_test/modular_test.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';
import 'package:muvver_app/modules/transports/domain/usecase/search_transports.dart';

void main() {
  initModule(AppModule());
  testWidgets('Success - SearchTransportsImpl...', (tester) async {
    final usecase = Modular.get<SearchTransportsImpl>();

    final actual = await usecase();

    expect(actual, isA<List<Transport>>());
    expect(actual, isNotEmpty);
  });
}
