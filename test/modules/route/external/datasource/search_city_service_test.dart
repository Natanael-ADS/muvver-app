import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muvver_app/modules/route/external/datasource/search_city_service.dart';
import 'package:muvver_app/modules/route/infra/models/city_model.dart';
import 'package:muvver_app/modules/route/util/response_predictions_const.dart';

import 'search_city_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final http = MockDio();
  final service = SearchCityService(http);
  testWidgets('error - search city service ...', (tester) async {
    when(http.get(any)).thenThrow(Exception());

    final actual = await service.searchText("test");

    expect(actual, isA<List<CityModel>>());
  });

  testWidgets('sucess - search city service ...', (tester) async {
    when(http.get(any)).thenAnswer((realInvocation) async {
      return Response(
        requestOptions: RequestOptions(path: ""),
        data: ResponsePredictionsConst.data,
        statusCode: 200,
      );
    });

    final actual = await service.searchText("palmas");

    expect(actual, isA<List<CityModel>>());
    expect(actual, isNotEmpty);
  });
}
