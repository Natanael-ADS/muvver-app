import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muvver_app/modules/app_module.dart';
import 'package:modular_test/modular_test.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';
import 'package:muvver_app/modules/transports/domain/usecase/search_transports.dart';
import 'package:muvver_app/modules/traveler/domain/usecases/add_traveler.dart';
import 'package:muvver_app/modules/traveler/infra/models/traveler_model.dart';

void main() {
  initModule(AppModule());
  testWidgets('Success - SearchTransportsImpl...', (tester) async {
    final usecase = Modular.get<SearchTransportsImpl>();

    final actual = await usecase();

    expect(actual, isA<List<Transport>>());
    expect(actual, isNotEmpty);
  });

  testWidgets('Success - AddTravelerImpl...', (tester) async {
    final usecase = Modular.get<AddTravelerImpl>();

    usecase(TravelerModel(id: 1, idUser: 1, idTransport: 1));
  });
}
