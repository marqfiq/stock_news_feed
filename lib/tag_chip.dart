import 'package:flutter/material.dart';
import 'dark_mode_model.dart';
import 'package:provider/provider.dart';

class TagChip extends StatelessWidget {

  final String tag;
  TagChip({this.tag});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeModel>(
      builder: (context, themeDefine, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
          child: Chip(
            backgroundColor: themeDefine.chosenTheme.secondary,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            label: Text(
              tag,
              style: TextStyle(
                color: themeDefine.chosenTheme.text,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}