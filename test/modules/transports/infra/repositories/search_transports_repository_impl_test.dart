import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';
import 'package:muvver_app/modules/transports/infra/datasources/search_transports_datasource.dart';
import 'package:muvver_app/modules/transports/infra/models/transport_model.dart';
import 'package:muvver_app/modules/transports/infra/repositories/search_transports_repository_impl.dart';

import 'search_transports_repository_impl_test.mocks.dart';

@GenerateMocks([SearchTransportsDatasource])
void main() {
  final datasource = MockSearchTransportsDatasource();
  final repository = SearchTransportsResitoryImpl(datasource);
  testWidgets('erro - search transports repository impl', (_) async {
    when(datasource.searchAll()).thenThrow(Exception());

    final result = await repository.search();
    expect(result, isA<List<Transport>>());
  });

  testWidgets('success - search transports repository impl', (_) async {
    when(datasource.searchAll()).thenAnswer((_) async {
      return [TransportModel(id: 1, name: "teste", pathImage: "teste.png")];
    });

    final result = await repository.search();
    expect(result, isA<List<Transport>>());
    expect(result, isNotEmpty);
  });
}
