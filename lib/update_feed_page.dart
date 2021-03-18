import 'package:flutter/material.dart';
import 'dark_mode_model.dart';
import 'package:provider/provider.dart';


class UpdateFeedPage extends StatefulWidget {

  @override
  _CreateFeedPageState createState() => _CreateFeedPageState();
}

class _CreateFeedPageState extends State<UpdateFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeModel>(
        builder: (context, themeDefine, child) {
          return Scaffold(
            backgroundColor: themeDefine.chosenTheme.main,
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                    Icons.arrow_back,
                    color: themeDefine.chosenTheme.text),
                onPressed: () {
                  Navigator.pop(context, '/createFeed');
                },
              ),
              title: Text(
                  'Edit Feed',
                  style: TextStyle(
                    color: themeDefine.chosenTheme.text
                  ),
              ),
              backgroundColor: themeDefine.chosenTheme.main,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                  child: TextField(
                    style: TextStyle(
                      color: themeDefine.chosenTheme.text,
                      fontSize: 16.0
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: themeDefine.chosenTheme.accent),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: themeDefine.chosenTheme.accent),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: themeDefine.chosenTheme.accent),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      labelText: 'Start Typing to Search',
                      labelStyle: TextStyle(color: themeDefine.chosenTheme.accent)

                    ),
                    cursorColor: themeDefine.chosenTheme.accent,
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    'Create New Feed',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    primary: themeDefine.chosenTheme.accent,
                    onPrimary: themeDefine.chosenTheme.main,
                  ),
                  onPressed: () {
                    Navigator.pop(context,'/updateFeed');
                  },
                )
              ],
            )
          );
        },
    );
  }
}
