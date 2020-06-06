import 'package:flutter/material.dart';
import 'package:srl/widgets/settings_list_tile.dart';
import 'package:srl/extensions/color.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _selectedUnit = _SelectedUnit.f;

    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
      ),
      child: Column(
        children: [
          /// 1. background layer (dark blue box)
          /// 2. white selector container
          /// 3. temperature text
          Expanded(
            child: Center(
              child: Container(
                width: 150,
                height: 125 * 3.0,
                decoration: BoxDecoration(
                  color: Colors.black.opacity100,
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Builder(
                  builder: (context) {
                    final width = 125.0;

                    return SizedBox(
                      child: Stack(
                        children: [
                          /// Temp setting selector
                          /// - Will need to animate over the temp selections
                          /// - Will need to set the temp selection colors based on current selection
                          /// - Align the selector properly
                          /// - Persist selection
                          Container(
                            width: width,
                            height: width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(36),
                            ),
                          ),

                          /// Lays out the temp selections
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (var unit in _SelectedUnit.values)
                                SizedBox.fromSize(
                                  size: Size.square(width),
                                  child: Center(
                                    child: Text(
                                      unit.text,
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: _selectedUnit == unit
                                            ? Colors.blue
                                            : Colors.white.opacity800,
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
          ),

          /// Lay out other settings
          for (var text in ["Autoplay Radar", "Icon Animations"])
            SettingsListTile(text: text),
        ],
      ),
    );
  }
}

enum _SelectedUnit { f, c, k }

extension SelectedUnitLocalizationX on _SelectedUnit {
  String get text {
    switch (this) {
      case _SelectedUnit.f:
        return "F";
      case _SelectedUnit.c:
        return "C";
      case _SelectedUnit.k:
      default:
        return "K";
    }
  }
}
