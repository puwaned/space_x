// Mocks generated by Mockito 5.4.0 from annotations
// in spacex/test/blocs/rocket_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:spacex/model/rocket_model.dart' as _i3;
import 'package:spacex/repo/rocket_repo.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRocketModel_1 extends _i1.SmartFake implements _i3.RocketModel {
  _FakeRocketModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RocketRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRocketRepository extends _i1.Mock implements _i4.RocketRepository {
  MockRocketRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);
  @override
  set dio(_i2.Dio? _dio) => super.noSuchMethod(
        Invocation.setter(
          #dio,
          _dio,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<_i3.RocketModel> getOne(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getOne,
          [id],
        ),
        returnValue: _i5.Future<_i3.RocketModel>.value(_FakeRocketModel_1(
          this,
          Invocation.method(
            #getOne,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.RocketModel>);
}