import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/main.dart';

void main() {
  testWidgets('renders the starter home screen', (tester) async {
    await tester.pumpWidget(const CypurgeApp());

    expect(find.byType(SplashScreen), findsOneWidget);
  });
}

