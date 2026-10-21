import 'package:flutter/widgets.dart';

/// Rebuilds every widget below [context].
///
/// AppTheme's colours and text styles are static getters over `AppTheme.light`,
/// not an InheritedWidget, so nothing on screen depends on the theme in a way
/// Flutter can see. Flipping it rebuilt the app's theme, but the screen
/// already showing kept its old colours until something else rebuilt it —
/// which is why the light/dark switch only took effect after changing tab.
///
/// ponytail: a whole-tree rebuild, on a rare tap. Making AppTheme an
/// InheritedWidget would rebuild only what reads it, at the cost of threading a
/// context through every static use in the app.
void rebuildDescendants(BuildContext context) {
  void mark(Element element) {
    element.markNeedsBuild();
    element.visitChildren(mark);
  }

  context.visitChildElements(mark);
}
