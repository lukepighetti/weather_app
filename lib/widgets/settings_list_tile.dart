import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srl/extensions/color.dart';

/// A custom "ListTile" with a platform aware Switch widget. (Why don't we use SwitchListTile.adaptive? GREAT QUESTION lol)
class SettingsListTile extends StatefulWidget {
  const SettingsListTile({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  _SettingsListTileState createState() => _SettingsListTileState();
}

class _SettingsListTileState extends State<SettingsListTile> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0) +
          const EdgeInsets.only(left: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontFamily: "",
              color: Colors.white.opacity700,
              letterSpacing: 0.5,
            ),
          ),
          CupertinoSwitch(
            activeColor: Theme.of(context).accentColor,
            trackColor: Colors.black.opacity100,
            value: _selected,
            onChanged: (e) {
              setState(() => _selected = e);
            },
          ),
        ],
      ),
    );
  }
}
