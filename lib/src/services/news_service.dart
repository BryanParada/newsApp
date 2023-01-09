
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
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category( FontAwesomeIcons.building, 'business'),
    Category( FontAwesomeIcons.tv, 'entertainment'),
    Category( FontAwesomeIcons.addressCard, 'general'),
    Category( FontAwesomeIcons.headSideVirus, 'health'),
    Category( FontAwesomeIcons.vials, 'science'),
    Category( FontAwesomeIcons.baseball, 'sports'),
    Category( FontAwesomeIcons.memory, 'technology'),

 
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() { 
    this.getTopHeadlines(); 

    categories.forEach((item) { 
      this.categoryArticles[item.name] = []; //new List()
    });
  }

  String get selectedCategory => this._selectedCategory;
  set selectedCategory(String value){
    this._selectedCategory = value;

    this.getArticlesByCategory( value );
    notifyListeners();
  }

  getTopHeadlines() async {
    
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';
    final uri = Uri.parse(url);
    final resp = await http.get(uri); 
    //final resp = await Uri.parse(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll( newsResponse.articles);
    notifyListeners();

    
  }


  getArticlesByCategory ( String category)async{

    if ( this.categoryArticles[category]!.length > 0){
      return this.categoryArticles[category];
    }

    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us&category=${category}';
    final uri = Uri.parse(url);
    final resp = await http.get(uri);  

    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category]!.addAll( newsResponse.articles ); 
    notifyListeners();

  }


}