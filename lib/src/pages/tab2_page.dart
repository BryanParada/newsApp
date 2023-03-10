import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final newsService  = Provider.of<NewsService>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[

            // Expanded(child: _ListCategory()),
            _ListCategory(),

            // Expanded(
            //   child: ListNews( newsService.getArticlesCategorySelected ),
            // ),

            Expanded(
              child: (newsService.categoryArticles[newsService.selectedCategory]!.length == 0) 
              ? Center(child: CircularProgressIndicator(color: myTheme.colorScheme.secondary,),)
              : ListNews(newsService.getArticlesCategorySelected)
            ),

          ],
        ),
      )
    );
  }
}

class _ListCategory extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      // color: Colors.red,
      child: Container(
        width: double.infinity,
        height: 80,
        //color: Colors.red,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {

            final cName = categories[index].name;

            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  _CategoryButtton(categories[index]),
                  SizedBox(height: 5,),
                  Text( '${cName[0].toUpperCase()}${cName.substring(1)}')
                ],
              )
              );
          },
        ),
      ),
    );
  }
}

class _CategoryButtton extends StatelessWidget {

  final Category category;
 

  const _CategoryButtton(this.category);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
          //print('${category.name}');
          final newsService = Provider.of<NewsService>(context, listen: false);
          newsService.selectedCategory = category.name;
          
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric( horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color: ( newsService.selectedCategory == this.category.name)
                 ? myTheme.colorScheme.secondary
                 :  Colors.black54,
        )
      ),
    );
  }
}