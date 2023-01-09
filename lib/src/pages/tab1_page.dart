import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
 
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}
//para mantener estado del scroll entre swipes de pantalla v
class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;
    //newsService.headlines;
    //ListNews(headlines ) 

    return Scaffold(
      body: ( headlines.length == 0)
      ? Center(child: CircularProgressIndicator(),)
      : ListNews(headlines ),
    );
  }
  //para mantener estado del scroll entre swipes de pantalla
  @override 
  bool get wantKeepAlive => true;
}