
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = dotenv.env['API_KEY'].toString();
class NewsService with ChangeNotifier{

  List<Article?> headlines = [];

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'businesss'),
    Category( FontAwesomeIcons.tv, 'entertainment'),
    Category( FontAwesomeIcons.addressCard, 'general'),
    Category( FontAwesomeIcons.headSideVirus, 'health'),
    Category( FontAwesomeIcons.vials, 'science'),
    Category( FontAwesomeIcons.baseball, 'sports'),
    Category( FontAwesomeIcons.memory, 'technology'),

 
  ];

  NewsService() {

    this.getTopHeadlines();

  }

  getTopHeadlines() async {
    
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';
    final uri = Uri.parse(url);
    final resp = await http.get(uri); 
    //final resp = await Uri.parse(url);

    final newsResponse = NewsResponse.fromJson(resp.body);

    this.headlines.addAll( newsResponse.articles!);
    notifyListeners();

    
  }



}