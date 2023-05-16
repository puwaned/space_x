import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';
import 'package:spacex/presentation/launch/bloc/bloc.dart';
import 'package:spacex/presentation/launch/bloc/event.dart';
import 'package:spacex/presentation/launch/bloc/state.dart';
import 'package:spacex/presentation/shared/http_status.dart';
import 'package:spacex/repo/launch_repo.dart';

import '../common.dart';
import 'launch_bloc_test.mocks.dart';

@GenerateMocks([LaunchRepository])
main() {
  MockLaunchRepository repository = MockLaunchRepository();
  LaunchBloc bloc = LaunchBloc(repository);
  late PaginationModel<LaunchModel> data;

  setUpAll(() {
    final docs = LaunchModel.parseList(
        exampleJsonLunchListWithPagination['docs'] as List<dynamic>);
    data = PaginationModel.fromJson(exampleJsonLunchListWithPagination, docs);
  });

  tearDown(() {
    bloc.close();
  });

  test('app close does not emit new app state', () async {
    bloc.close();
    await expectLater(bloc.stream, emitsInOrder([emitsDone]));
  });

  group('bloc launch state test', () {
    var filter = LaunchFilter(page: 1);
    var loadMoreFilter = LaunchFilter(page: 2);
    blocTest('emit load launch-list',
        build: () {
          when(repository.getAll(filter)).thenAnswer((_) => Future.value(data));
          return LaunchBloc(repository);
        },
        act: (bloc) => bloc.add(LoadLaunchEvent(filter: filter)),
        expect: () => [
              LaunchState(
                  data: PaginationModel<LaunchModel>.empty(),
                  filter: filter,
                  status: HttpRequestStatus.loading),
              LaunchState(
                  data: data, filter: filter, status: HttpRequestStatus.success)
            ]);

    blocTest('emit load more launch-list',
        build: () {
          when(repository.getAll(loadMoreFilter))
              .thenAnswer((_) => Future.value(data));
          return LaunchBloc(repository);
        },
        act: (bloc) => bloc.add(LoadMoreLaunchEvent(loadMoreFilter, data.docs)),
        expect: () => [
              LaunchState(
                  data: data,
                  filter: loadMoreFilter,
                  status: HttpRequestStatus.success)
            ]);

    blocTest('emit error state',
        build: () {
          when(repository.getAll(filter))
              .thenThrow('failed with status code 500');
          return LaunchBloc(repository);
        },
        act: (bloc) => bloc.add(LoadLaunchEvent(filter: filter)),
        expect: () => [
              LaunchState(
                  data: PaginationModel<LaunchModel>.empty(),
                  filter: filter,
                  status: HttpRequestStatus.loading),
              LaunchState(
                  data: PaginationModel<LaunchModel>.empty(),
                  error: 'failed with status code 500',
                  filter: filter,
                  status: HttpRequestStatus.failed)
            ]);
  });
}
