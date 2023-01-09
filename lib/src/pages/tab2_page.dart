import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          Expanded(child: _ListCategory()),


        ],
      )
    );
  }
}

class _ListCategory extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
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