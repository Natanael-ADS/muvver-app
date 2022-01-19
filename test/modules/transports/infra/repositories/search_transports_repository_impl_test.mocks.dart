// Mocks generated by Mockito 5.0.17 from annotations
// in muvver_app/test/modules/transports/infra/repositories/search_transports_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:muvver_app/modules/transports/infra/datasources/search_transports_datasource.dart'
    as _i2;
import 'package:muvver_app/modules/transports/infra/models/transport_model.dart'
    as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [SearchTransportsDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchTransportsDatasource extends _i1.Mock
    implements _i2.SearchTransportsDatasource {
  MockSearchTransportsDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.TransportModel>> searchAll() => (super.noSuchMethod(
          Invocation.method(#searchAll, []),
          returnValue:
              Future<List<_i4.TransportModel>>.value(<_i4.TransportModel>[]))
      as _i3.Future<List<_i4.TransportModel>>);
}
