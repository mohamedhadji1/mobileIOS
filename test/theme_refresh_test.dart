import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/theme/theme_refresh.dart';

/// Stands in for AppTheme: a static value a widget reads directly, with no
/// InheritedWidget telling Flutter the widget depends on it.
String _theme = 'light';

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) => Text(_theme);
}

void main() {
  testWidgets('a screen reading a static theme is redrawn when told to',
      (tester) async {
    _theme = 'light';
    final root = GlobalKey();
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: KeyedSubtree(key: root, child: const _Screen()),
    ));
    expect(find.text('light'), findsOneWidget);

    // The bug: flip the theme and nothing on screen changes.
    _theme = 'dark';
    await tester.pump();
    expect(find.text('light'), findsOneWidget);

    // The fix: the app redraws everything below the navigator.
    rebuildDescendants(root.currentContext!);
    await tester.pump();
    expect(find.text('dark'), findsOneWidget);
  });
}
