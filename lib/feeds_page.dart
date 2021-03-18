import 'package:flutter/material.dart';
import 'article_info.dart';
import 'feed_scroller.dart';
import 'feed_info.dart';
import 'feed_tab.dart';
import 'dark_mode_model.dart';
import 'package:provider/provider.dart';

class FeedsPage extends StatefulWidget {

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  final List<ArticleInfo> info = [
    ArticleInfo(title: 'Helen is cool', preview: 'this is a test for the new class I made',tags:['NFLX','HULU','HELEN']),
    ArticleInfo(title: 'Mark is cool', preview: 'this is another test',tags:['DOGS','CATS','MARK','BUTT']),
    ArticleInfo(title: 'Wow a third one', preview: 'IS it still working?? I can not believe it will it work if its too long?',tags:['TEST']),
    ArticleInfo(title: 'Wow a fourth one', preview: 'test',tags:['BOOB']),
    ArticleInfo(title: 'Wow a fourth one', preview: 'test',tags:['BOOB']),
    ArticleInfo(title: 'Helen is sucky', preview: 'Another article about Helen',tags:['NFLX','HULU','HELEN']),
  ];

  final List<FeedInfo> feedInfo = [
    FeedInfo(title: 'Feed 1', filters: ['test','test']),
    FeedInfo(title: 'Feed 2', filters: ['test','test']),
    FeedInfo(title: 'Feed 3', filters: ['test','test']),
    FeedInfo(title: 'Feed 4', filters: ['test','test']),
    FeedInfo(title: 'Feed 5', filters: ['test','test'])
  ];

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Consumer<DarkModeModel>(
          builder: (context, themeDefine, child) {
            return AlertDialog(
              backgroundColor: themeDefine.chosenTheme.secondary,
              title: Text(
                  'Create a New Feed',
                style: TextStyle(color: themeDefine.chosenTheme.text),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
                      child: Text(
                          'What is your new feed called?',
                          style: TextStyle(color: themeDefine.chosenTheme.text)
                      ),
                    ),
                    TextField(
                      style: TextStyle(
                          color: themeDefine.chosenTheme.text
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: themeDefine.chosenTheme.text),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: themeDefine.chosenTheme.text),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: themeDefine.chosenTheme.text),
                          ),
                          labelText: 'Feed Name',
                          labelStyle: TextStyle(color: themeDefine.chosenTheme.text)

                      ),
                      cursorColor: themeDefine.chosenTheme.accent,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Create Feed'),
                  style: TextButton.styleFrom(
                    primary: themeDefine.chosenTheme.accent
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/updateFeed');
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeModel>(
      builder: (context, themeDefine, child) {
        return DefaultTabController(
          length: feedInfo.length,
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: themeDefine.chosenTheme.text,
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: themeDefine.chosenTheme.text,
                  onPressed: () {
                    showMyDialog();
                  },
                ),
              ],
              backgroundColor: themeDefine.chosenTheme.main,
              bottom: TabBar(
                indicatorColor: themeDefine.chosenTheme.accent,
                isScrollable: true,
                tabs: feedInfo.map((feedInfo) =>
                    FeedTab(tabTitle: '${feedInfo.title}')).toList(),
              ),
              title: Text(
                'Feeds',
                style: TextStyle(
                  color: themeDefine.chosenTheme.text
                ),
              ),
            ),
            body: TabBarView(
              children: feedInfo.map((feedInfo) =>
                  FeedScroller(articleInfoList: info)).toList(),
            ),
          ),
        );
      }
    );
  }
}
