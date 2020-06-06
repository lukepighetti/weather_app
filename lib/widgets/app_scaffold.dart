import 'package:flutter/material.dart';

/// An opinionated app specific scaffold that
/// transitions foreground height and pages
class AppScaffold extends StatelessWidget {
  AppScaffold({
    @required this.pages,
    @required this.currentIndex,
    @required this.bottomNavigationBar,
    @required this.bottomNavigationBarHeight,
  });

  /// The pages to display
  final List<AppScaffoldPage> pages;

  /// The current index to display
  final int currentIndex;

  /// The bottom navigation bar to display
  final Widget bottomNavigationBar;

  /// The height of the bottom navigation bar
  final double bottomNavigationBarHeight;

  /// The page transition duration
  final _duration = Duration(milliseconds: 300);

  /// The page transition curve
  final _curve = Curves.easeInOutExpo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background
        AnimatedContainer(
          duration: _duration,
          curve: _curve,
          padding: EdgeInsets.only(
            bottom: pages[currentIndex].foregroundHeight +
                bottomNavigationBarHeight,
          ),
          child: SafeArea(
            bottom: false,
            child: Stack(
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
          ),
        ),

        /// Foreground
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            height: pages[currentIndex].foregroundHeight +
                bottomNavigationBarHeight,
            curve: _curve,
            duration: _duration,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.vertical(
                top: pages[currentIndex].borderRadius ?? Radius.circular(36),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: -20,
                  blurRadius: 24,
                ),
              ],
            ),
            child: AnimatedContainer(
              duration: _duration,
              curve: _curve,
              padding: EdgeInsets.only(bottom: bottomNavigationBarHeight) +
                  pages[currentIndex].foregroundPadding,
              child: Stack(
                children: [
                  for (var page in pages)
                    AnimatedOpacity(
                      opacity: pages.indexOf(page) == currentIndex ? 1.0 : 0.0,
                      duration: _duration,
                      curve: _curve,
                      child: page.foreground,
                    ),
                ],
              ),
            ),
          ),
        ),

        /// Navigation bar
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomNavigationBar ?? SizedBox.shrink(),
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
    this.foregroundPadding = EdgeInsets.zero,
    this.borderRadius,
  });

  final Widget background;
  final Widget foreground;
  final double foregroundHeight;
  final Radius borderRadius;
  final EdgeInsets foregroundPadding;
}
