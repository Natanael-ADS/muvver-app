import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:muvver_app/modules/traveler/domain/repositories/add_traveler_repository.dart';
import 'package:muvver_app/modules/traveler/domain/unities/traveler.dart';
import 'package:muvver_app/modules/traveler/domain/usecases/add_traveler.dart';

import 'add_traveler_test.mocks.dart';

@GenerateMocks([AddTravelerRepository])
void main() {
  final repository = MockAddTravelerRepository();
  final usecase = AddTravelerImpl(repository);
  testWidgets('error - add traveler ...', (tester) async {
    when(repository.add(any)).thenThrow(Exception());

    usecase(Traveler(idUser: 1, idTransports: 1));
  });

  testWidgets('success - add traveler ...', (tester) async {
    usecase(Traveler(idUser: 1, idTransports: 1));
  });
}
