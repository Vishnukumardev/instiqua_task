// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:instiqua_app/main.dart';
import 'package:instiqua_app/utils/path_provider.dart';

void main() {
  testWidgets('MyApp launches and displays Dashboard', (
    WidgetTester tester,
  ) async {
    //Initialize the dependencies running in the app
    WidgetsFlutterBinding.ensureInitialized();
    DependencyInjection.init();

    //Build  app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    //check for the widget that is expected on Dashboard screen
    expect(find.byType(DashbordPage), findsOneWidget);
  });
}
