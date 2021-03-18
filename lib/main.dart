import 'package:flutter/material.dart';
import 'feeds_page.dart';
import 'settings_page.dart';
import 'update_feed_page.dart';
import 'package:provider/provider.dart';
import 'dark_mode_model.dart';


void main() {
  runApp(FeedsApp());
}

class FeedsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeModel>(
          create: (context) => DarkModeModel()
        )
      ],
      child: MaterialApp(
          initialRoute: '/home',
          routes: {
            '/home': (context) => FeedsPage(),
            '/settings': (context) => SettingsPage(),
            '/updateFeed': (context) => UpdateFeedPage()
          }
      ),
    );
  }
}



