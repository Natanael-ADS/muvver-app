import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muvver_app/modules/transports/domain/repositories/search_transports_repository.dart';
import 'package:muvver_app/modules/transports/domain/unities/transport.dart';
import 'package:muvver_app/modules/transports/domain/usecase/search_transports.dart';

import 'search_transports_test.mocks.dart';

@GenerateMocks([SearchTransportsRepository])
void main() {
  final repository = MockSearchTransportsRepository();
  final usecase = SearchTransportsImpl(repository);
  testWidgets('error - search transports ...', (tester) async {
    when(repository.search()).thenThrow(Exception());

    final result = await usecase();

    expect(result, isA<List<Transport>>());
  });

  testWidgets('success - search transports ...', (tester) async {
    when(repository.search()).thenAnswer((_) async {
      return [Transport(id: 1, name: "teste", pathImage: "teste.png")];
    });

    final result = await usecase();

    expect(result, isA<List<Transport>>());
    expect(result, isNotEmpty);
  });
}
