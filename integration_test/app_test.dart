// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spacex/main.dart' as app;
import 'package:spacex/presentation/launch/view/launch_list.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // group('Launch screen test', () {
  //   testWidgets('test search function', (tester) async {
  //     app.main();
  //     await tester.pumpAndSettle();
  //
  //     final searchIcon = find.byKey(const Key('search_bar'));
  //     await tester.tap(searchIcon);
  //     await tester.pumpAndSettle();
  //
  //     final searchTextField = find.byType(TextField);
  //
  //     await tester.enterText(searchTextField, 'amos');
  //     await tester.pumpAndSettle();
  //     expect(find.byType(LaunchRocketCard), findsNWidgets(2));
  //
  //     await tester.enterText(searchTextField, 'falcon');
  //     await tester.pumpAndSettle();
  //     expect(find.byType(LaunchRocketCard), findsNWidgets(3));
  //
  //     await tester.enterText(searchTextField, "asdasdasdasdasd");
  //     await tester.pumpAndSettle();
  //     expect(find.byType(LaunchRocketCard), findsNothing);
  //   });
  //
  //   testWidgets('test infinite scroll pagination', (tester) async {
  //     app.main();
  //     await tester.pumpAndSettle();
  //
  //     final launchListview = find.byKey(const Key('launch_list_view'));
  //     await tester.drag(launchListview, const Offset(0, -4700));
  //     await tester.pump();
  //     expect(find.byKey(const Key('launch_list_view_load_more')), findsOneWidget);
  //     // final launchCard = find.byKey(const Key('launch_card_inkwell'), skipOffstage: false);
  //     // expect(launchCard, findsNWidgets(20));
  //
  //     // final launchListview = find.byKey(const Key('launch_list_view'));
  //     // await tester.drag(launchListview, const Offset(0, -10000));
  //     // await tester.pumpAndSettle();
  //     //
  //     // expect(find.byKey(const Key('launch_list_view_load_more')), findsOneWidget);
  //   });
  // });

  group('Launch detail screen test', () {
    testWidgets('test swipe image', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final launchCard = find.byType(LaunchRocketCard).first;
      await tester.tap(launchCard);
      await tester.pumpAndSettle();

      // final carousel = find.byKey(const Key('launch_detail_carousel_slider'));
      // await tester.drag(finder, offset);

      // await Future.delayed(Duration(seconds: 2));
    });
  });
}
