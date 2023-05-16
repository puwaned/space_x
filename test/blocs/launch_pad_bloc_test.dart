import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex/model/launch_pad_model.dart';
import 'package:spacex/presentation/launch_pad/bloc/bloc.dart';
import 'package:spacex/presentation/launch_pad/bloc/event.dart';
import 'package:spacex/presentation/launch_pad/bloc/state.dart';
import 'package:spacex/presentation/shared/http_status.dart';
import 'package:spacex/repo/launch_pad_repo.dart';

import '../common.dart';
import 'launch_pad_bloc_test.mocks.dart';

@GenerateMocks([LaunchPadRepository])
main() {
  const id = '5e9e4501f509094ba4566f84';
  final repository = MockLaunchPadRepository();
  final bloc = LaunchPadBloc(repository, id);
  late LaunchPadModel data;

  setUpAll(() {
    data = LaunchPadModel.fromJson(exampleJsonLaunchPad);
  });

  tearDown(() {
    bloc.close();
  });

  test('app close does not emit new app state', () async {
    bloc.close();
    await expectLater(bloc.stream, emitsInOrder([emitsDone]));
  });

  group('bloc launch-pad state test', () {
    blocTest('emit load launch-pad',
        build: () {
          when(repository.getOne(id)).thenAnswer((_) => Future.value(data));
          return LaunchPadBloc(repository, id);
        },
        act: (bloc) => bloc.add(const LoadLaunchPadEvent()),
        expect: () => [
              LaunchPadState(status: HttpRequestStatus.loading, error: ""),
              LaunchPadState(
                  data: data, status: HttpRequestStatus.success, error: "")
            ]);

    blocTest('emit error launch-pad',
        build: () {
          when(repository.getOne(id)).thenThrow('failed with status code 500');
          return LaunchPadBloc(repository, id);
        },
        act: (bloc) => bloc.add(const LoadLaunchPadEvent()),
        expect: () => [
              LaunchPadState(status: HttpRequestStatus.loading, error: ""),
              LaunchPadState(
                  status: HttpRequestStatus.failed,
                  error: "failed with status code 500")
            ]);
  });
}
