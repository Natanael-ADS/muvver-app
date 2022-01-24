import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muvver_app/modules/app_module.dart';
import 'package:modular_test/modular_test.dart';
import 'package:muvver_app/modules/route/domain/unities/city.dart';
import 'package:muvver_app/modules/route/domain/usecase/search_city.dart';
import 'package:muvver_app/modules/route/util/response_predictions_const.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';
import 'package:muvver_app/modules/transports/domain/usecase/search_transports.dart';
import 'package:muvver_app/modules/traveler/domain/usecases/add_traveler.dart';
import 'package:muvver_app/modules/traveler/infra/models/traveler_model.dart';

import 'app_module_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dioMock = MockDio();

  initModule(
    AppModule(),
    replaceBinds: [Bind.instance<Dio>(dioMock)],
  );

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

  testWidgets('Success - SearchCityImpl...', (tester) async {
    when(dioMock.get(any)).thenAnswer((realInvocation) async {
      return Response(
        requestOptions: RequestOptions(path: ""),
        data: ResponsePredictionsConst.data,
        statusCode: 200,
      );
    });

    final usecase = Modular.get<SearchCityImpl>();

    final actual = await usecase("teste");

    expect(actual, isA<List<City>>());
    expect(actual, isNotEmpty);
  });
}
