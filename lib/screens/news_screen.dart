import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/components/home/news/news_list_views.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late ScrollController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    //_controller.addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
            // 6
            //shrinkWrap: true,
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            //physics: const ClampingScrollPhysics(),
            // physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              // 7
              NewsListView(),
              // 8
              const SizedBox(height: 16),
              // 9
              // TODO: Replace this with FriendPostListView
              //FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
            ],
          );
      
  }
}