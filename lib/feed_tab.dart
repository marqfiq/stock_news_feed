import 'package:flutter/material.dart';
import 'dark_mode_model.dart';
import 'package:provider/provider.dart';

class FeedTab extends StatelessWidget {

  final String tabTitle;
  FeedTab({this.tabTitle});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeModel>(
        builder: (context, themeDefine, child) {
          return Tab(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0,10.0,0.0,.0),
              child: Text(
                '$tabTitle',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: themeDefine.chosenTheme.text
                ),
              ),
            ),
          );
        },
    );
  }
}