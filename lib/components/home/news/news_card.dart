import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/models/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.news}) : super(key: key);
  final News news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Image(
                  image: AssetImage(news.imgUrl),
                  fit: BoxFit.scaleDown,
                ),
              ),
              // Text(
              //   news.title,
              //   style: TextStyle(fontSize: 18),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
