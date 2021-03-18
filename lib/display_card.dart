import 'package:flutter/material.dart';
import 'tag_chip.dart';
import 'article_info.dart';
import 'dark_mode_model.dart';
import 'package:provider/provider.dart';

class DisplayCard extends StatelessWidget {

  final ArticleInfo articleInfo;
  DisplayCard({this.articleInfo});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeModel>(
        builder: (context, themeDefine, child) {
          return Card(
            color: themeDefine.chosenTheme.main,
            child: Column(
              children: [
                Row(
                  children: articleInfo.tags.map((tag) => TagChip(tag:tag)).toList(),
                  mainAxisAlignment: MainAxisAlignment.start,

                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,10.0),
                      child: Text(
                        '${articleInfo.title}',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: themeDefine.chosenTheme.text
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
                        child: Text(
                          '${articleInfo.preview}',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: themeDefine.chosenTheme.text
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
    );
  }
}