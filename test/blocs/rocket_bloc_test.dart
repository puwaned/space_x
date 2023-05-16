import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex/model/rocket_model.dart';
import 'package:spacex/presentation/rocket/bloc/bloc.dart';
import 'package:spacex/presentation/rocket/bloc/event.dart';
import 'package:spacex/presentation/rocket/bloc/state.dart';
import 'package:spacex/presentation/shared/http_status.dart';
import 'package:spacex/repo/rocket_repo.dart';

import '../common.dart';
import 'rocket_bloc_test.mocks.dart';

@GenerateMocks([RocketRepository])
main() {
  const id = "5e9d0d95eda69973a809d1ec";
  final repository = MockRocketRepository();
  final bloc = RocketBloc(repository, id);
  late RocketModel data;

  setUpAll(() {
    data = RocketModel.fromJson(exampleJsonRocket);
  });

  tearDown(() {
    bloc.close();
  });

  test('app close does not emit new app state', () async {
    bloc.close();
    await expectLater(bloc.stream, emitsInOrder([emitsDone]));
  });

  group('bloc rocket state test', () {
    blocTest('emit load rocket',
        build: () {
          when(repository.getOne(id)).thenAnswer((_) => Future.value(data));
          return RocketBloc(repository, id);
        },
        act: (bloc) => bloc.add(LoadRocketEvent()),
        expect: () => [
              RocketState(status: HttpRequestStatus.loading),
              RocketState(status: HttpRequestStatus.success, data: data),
            ]);

    blocTest('emit error rocket',
        build: () {
          when(repository.getOne(id)).thenThrow('failed with status code 500');
          return RocketBloc(repository, id);
        },
        act: (bloc) => bloc.add(LoadRocketEvent()),
        expect: () => [
              RocketState(status: HttpRequestStatus.loading),
              RocketState(
                  status: HttpRequestStatus.failed,
                  error: 'failed with status code 500'),
            ]);
  });
}
