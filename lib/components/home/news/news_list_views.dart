import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/components/home/services_components/services_grid_view.dart';
import 'package:flutter_hosham_app/generated/locale_keys.g.dart';
// import 'package:flutter_hosham_app/models/news.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'news_card.dart';

class NewsListView extends StatelessWidget {
  // 2
  //final List<ExploreRecipe> recipes;

  const NewsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      // 4
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 5 🍳
          Text(LocaleKeys.ads_title, style: Theme.of(context).textTheme.headline2).tr(),
          // 6
          const SizedBox(height: 16),
          // 7
//           Container(
//             height: 250,
//             // TODO: Add ListView Here
//
//             // 1
//             color: Colors.transparent,
// // 2
//             child: ListView.separated(
//               // 3
//               scrollDirection: Axis.horizontal,
//               // 4
//               itemCount: newsList.length,
//               // 5
//               itemBuilder: (context, index) {
//                 // 6
//                 final news = newsList[index];
//                 return NewsCard(news: news);
//               },
//               // 7
//               separatorBuilder: (context, index) {
//                 // 8
//                 return const SizedBox(width: 16);
//               },
//             ),
//           ),
        ImageSlideshow(width: double.infinity,
          height: 200,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
          },
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Image.asset(
              'assets/news/news2.jpg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/news/news1.jpg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/news/news2.jpg',
              fit: BoxFit.cover,
            ),
          ],),
          //Text('Events 🍳', style: Theme.of(context).textTheme.headline2),
          // 6
          const SizedBox(height: 16),
          // 7
          Container(
            // height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            //height: 350,
            // TODO: Add ListView Here

            // 1
            color: Colors.transparent,
// 2
            child: ServicesGridView(),
          ),
        ],
      ),
    );
  }
}

// TODO: Add buildCard() widget here
//   Widget buildCard(ExploreRecipe recipe) {
//     if (recipe.cardType == RecipeCardType.card1) {
//       return Card1(recipe: recipe);
//     } else if (recipe.cardType == RecipeCardType.card2) {
//       return Card2(recipe: recipe);
//     } else if (recipe.cardType == RecipeCardType.card3) {
//       return Card3(recipe: recipe);
//     } else {
//       throw Exception('This card doesn\'t exist yet');
//     }
//   }
// }
