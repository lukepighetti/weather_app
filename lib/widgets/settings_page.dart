import 'package:flutter/material.dart';
import 'package:srl/widgets/settings_list_tile.dart';
import 'package:srl/extensions/color.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  child: Stack(
                    children: [
                      /// Temp setting selector
                      /// - Will need to animate over the temp selections
                      /// - Will need to set the temp selection colors based on current selection
                      /// - Align the selector properly
                      /// - Persist selection
                      Positioned(
                        child: Container(
                          width: 125,
                          height: 125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                      ),

                      /// Lays out the temp selections
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (var text in ['F', 'C', 'K']) ...[
                            Center(
                              child: Text(
                                text,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
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
