import 'package:flutter/material.dart';

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
          Text(widget.text),
          Switch.adaptive(
            activeColor: Theme.of(context).accentColor,
            value: _selected,
            onChanged: (bool) {
              setState(() => _selected = bool);
            },
          ),
        ],
      ),
    );
  }
}
