// Mocks generated by Mockito 5.4.4 from annotations
// in next_solutions/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i14;
import 'dart:typed_data' as _i16;

import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i15;
import 'package:next_solutions/core/error/failure.dart' as _i7;
import 'package:next_solutions/core/local/cache_helper.dart' as _i5;
import 'package:next_solutions/core/platform/network_info.dart' as _i12;
import 'package:next_solutions/data/data_sources/reservations_local_data_source.dart'
    as _i11;
import 'package:next_solutions/data/data_sources/reservations_remote_data_source.dart'
    as _i9;
import 'package:next_solutions/data/models/reservation_model.dart' as _i10;
import 'package:next_solutions/domain/entities/reservation.dart' as _i8;
import 'package:next_solutions/domain/repositories/reservations_repository.dart'
    as _i3;
import 'package:next_solutions/domain/use_cases/get_reservations_use_case.dart'
    as _i13;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUnit_1 extends _i1.SmartFake implements _i2.Unit {
  _FakeUnit_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReservationRepository_2 extends _i1.SmartFake
    implements _i3.ReservationRepository {
  _FakeReservationRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CacheHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockCacheHelper extends _i1.Mock implements _i5.CacheHelper {
  MockCacheHelper() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [ReservationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockReservationRepository extends _i1.Mock
    implements _i3.ReservationRepository {
  MockReservationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Reservation>>>
      getReservations() => (super.noSuchMethod(
            Invocation.method(
              #getReservations,
              [],
            ),
            returnValue: _i6
                .Future<_i2.Either<_i7.Failure, List<_i8.Reservation>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.Reservation>>(
              this,
              Invocation.method(
                #getReservations,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Reservation>>>);
}

/// A class which mocks [ReservationsRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockReservationsRemoteDataSource extends _i1.Mock
    implements _i9.ReservationsRemoteDataSource {
  MockReservationsRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i10.ReservationModel>> getReservations() =>
      (super.noSuchMethod(
        Invocation.method(
          #getReservations,
          [],
        ),
        returnValue: _i6.Future<List<_i10.ReservationModel>>.value(
            <_i10.ReservationModel>[]),
      ) as _i6.Future<List<_i10.ReservationModel>>);
}

/// A class which mocks [ReservationsLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockReservationsLocalDataSource extends _i1.Mock
    implements _i11.ReservationsLocalDataSource {
  MockReservationsLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i10.ReservationModel>> getCachedReservations() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedReservations,
          [],
        ),
        returnValue: _i6.Future<List<_i10.ReservationModel>>.value(
            <_i10.ReservationModel>[]),
      ) as _i6.Future<List<_i10.ReservationModel>>);

  @override
  _i6.Future<_i2.Unit> cacheReservations(
          List<_i10.ReservationModel>? reservations) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheReservations,
          [reservations],
        ),
        returnValue: _i6.Future<_i2.Unit>.value(_FakeUnit_1(
          this,
          Invocation.method(
            #cacheReservations,
            [reservations],
          ),
        )),
      ) as _i6.Future<_i2.Unit>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i12.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [GetReservationsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetReservationsUseCase extends _i1.Mock
    implements _i13.GetReservationsUseCase {
  MockGetReservationsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ReservationRepository get reservationRepository => (super.noSuchMethod(
        Invocation.getter(#reservationRepository),
        returnValue: _FakeReservationRepository_2(
          this,
          Invocation.getter(#reservationRepository),
        ),
      ) as _i3.ReservationRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Reservation>>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.Reservation>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.Reservation>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Reservation>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);

  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(_i15.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i16.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i16.Uint8List>.value(_i16.Uint8List(0)),
      ) as _i6.Future<_i16.Uint8List>);

  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_4(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
