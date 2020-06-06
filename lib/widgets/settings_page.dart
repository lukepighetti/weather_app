import 'package:flutter/material.dart';
import 'package:srl/widgets/settings_list_tile.dart';
import 'package:srl/extensions/color.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var _selectedUnit = _SelectedUnit.f;

  final _duration = Duration(milliseconds: 750);
  final _curve = Curves.easeOutExpo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Unit selector
        Expanded(
          child: Center(
            child: Builder(
              builder: (context) {
                final width = 125.0;
                final inset = 10.0;

                return Container(
                  width: width + inset * 2,
                  height: (width + inset * 2) * 3.0,
                  decoration: BoxDecoration(
                    color: Colors.black.opacity100,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Stack(
                    children: [
                      /// TODO: Persist selection

                      /// Background
                      AnimatedContainer(
                        duration: _duration,
                        curve: _curve,
                        alignment: () {
                          switch (_selectedUnit) {
                            case _SelectedUnit.f:
                              return Alignment.topCenter;
                            case _SelectedUnit.c:
                              return Alignment.center;
                            case _SelectedUnit.k:
                            default:
                              return Alignment.bottomCenter;
                          }
                        }(),
                        child: Container(
                          width: width,
                          height: width,
                          margin: EdgeInsets.all(inset),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                      ),

                      /// Unit selection inkwells
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (var unit in _SelectedUnit.values)
                            SizedBox.fromSize(
                              size: Size.square((width + inset * 2)),
                              child: Padding(
                                padding: EdgeInsets.all(inset),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(36),
                                    onTap: () {
                                      setState(() {
                                        _selectedUnit = unit;
                                      });
                                    },
                                    child: Center(
                                      child: TweenAnimationBuilder<Color>(
                                        duration: _duration,
                                        curve: _curve,
                                        tween: _selectedUnit == unit
                                            ? ColorTween(
                                                end: Theme.of(context)
                                                    .primaryColor)
                                            : ColorTween(
                                                end: Colors.white.opacity800),
                                        builder: (context, tweenColor, child) {
                                          /// Unit text
                                          return Transform.translate(
                                            offset: unit.offset,
                                            child: Text(
                                              unit.text,
                                              style: TextStyle(
                                                fontSize: 50,
                                                color: tweenColor,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

        Container(
          height: 5,
          color: Colors.black.opacity50,
        ),

        SizedBox(height: 10),

        /// Lay out other settings
        for (var text in ["Autoplay Radar", "Icon Animations"])
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: SettingsListTile(text: text),
          ),

        SizedBox(height: 10),
      ],
    );
  }
}

enum _SelectedUnit { f, c, k }

extension SelectedUnitLocalizationX on _SelectedUnit {
  String get text {
    switch (this) {
      case _SelectedUnit.f:
        return "°F";
      case _SelectedUnit.c:
        return "°C";
      case _SelectedUnit.k:
      default:
        return "°K";
    }
  }

  Offset get offset {
    switch (this) {
      case _SelectedUnit.f:
        return Offset(-6.5, 0.0);
      case _SelectedUnit.c:
        return Offset(-4.0, 0.0);
      case _SelectedUnit.k:
      default:
        return Offset(-4.0, 0.0);
    }
  }
}
