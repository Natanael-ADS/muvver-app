import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:muvver_app/modules/app_module.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';
import 'package:muvver_app/modules/transports/presenter/select_transport_store.dart';

void main() {
  initModule(AppModule());
  final store = SelectTransportStore();
  testWidgets('search - select transport store ...', (tester) async {
    await store.getTransports();
    final actual = store.transports;

    expect(actual, isA<List<Transport>>());
    expect(actual, isNotEmpty);
  });
}
