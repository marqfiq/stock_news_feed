import 'package:flutter/material.dart';
import 'article_info.dart';
import 'display_card.dart';
import 'dark_mode_model.dart';
import 'package:provider/provider.dart';

class FeedScroller extends StatefulWidget {

  final List<ArticleInfo> articleInfoList;
  FeedScroller({this.articleInfoList});

  @override
  _FeedScrollerState createState() => _FeedScrollerState();
}

class _FeedScrollerState extends State<FeedScroller> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeModel>(
        builder: (context, themeDefine, child) {
          return Scaffold(

            body: ListView(
              padding: const EdgeInsets.all(8),
              children: widget.articleInfoList.map((articleInfo) => DisplayCard(articleInfo:articleInfo)).toList(),
            ),
            backgroundColor: themeDefine.chosenTheme.secondary,
          );
        },
    );
  }
}

