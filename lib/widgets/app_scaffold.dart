import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({
    @required this.pages,
    @required this.currentIndex,
    @required this.bottomNavigationBar,
  });

  /// The pages to display
  final List<AppScaffoldPage> pages;

  /// The current index to display
  final int currentIndex;

  /// The bottom navigation bar to display
  final Widget bottomNavigationBar;

  /// The page transition duration
  final _duration = Duration(milliseconds: 300);

  /// The page transition curve
  final _curve = Curves.easeInOutExpo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background
        Stack(
          children: [
            for (var page in pages)
              AnimatedOpacity(
                opacity: pages.indexOf(page) == currentIndex ? 1.0 : 0.0,
                duration: _duration,
                curve: _curve,
                child: page.background,
              ),
          ],
        ),

        /// Foreground
        AnimatedContainer(
          height: pages[currentIndex].foregroundHeight,
          curve: _curve,
          duration: _duration,
          child: Stack(
            children: [
              for (var page in pages)
                AnimatedOpacity(
                  opacity: pages.indexOf(page) == currentIndex ? 1.0 : 0.0,
                  duration: _duration,
                  curve: _curve,
                  child: page.foreground,
                ),

              /// Navigation bar
              bottomNavigationBar ?? SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}

/// A page to display in [AppScaffold]
class AppScaffoldPage {
  AppScaffoldPage({
    @required this.background,
    @required this.foreground,
    @required this.foregroundHeight,
  });

  final Widget background;
  final Widget foreground;
  final double foregroundHeight;
}
