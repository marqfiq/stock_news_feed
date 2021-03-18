import 'package:flutter/material.dart';
import 'dark_mode_model.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool isSwitched;
  @override
  Widget build(BuildContext context) {

    return Consumer<DarkModeModel>(
        builder: (context, themeDefine, child) {
          return Scaffold(
            backgroundColor: themeDefine.chosenTheme.main,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: themeDefine.chosenTheme.text,
                ),
                onPressed: () {
                  Navigator.pop(context, '/settings');
                },
              ),
              title: Text(
                  'Settings',
              style: TextStyle(
                color:themeDefine.chosenTheme.text
                )
              ),
              centerTitle: true,
              backgroundColor: themeDefine.chosenTheme.main,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Dark Theme',
                        style: TextStyle(
                          color: themeDefine.chosenTheme.text,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Switch(
                        value: isSwitched==null? false: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            var darkModeModel = context.read<DarkModeModel>();
                            darkModeModel.setTheme(isSwitched);

                          });
                        },
                        activeTrackColor: themeDefine.chosenTheme.accent,
                        activeColor: themeDefine.chosenTheme.secondary,
                        inactiveTrackColor: themeDefine.chosenTheme.accent,
                        inactiveThumbColor: themeDefine.chosenTheme.secondary,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  )
                ],
              ),
            ),
          );
        },
      );
  }
}
