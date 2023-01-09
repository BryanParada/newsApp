import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/theme.dart';

class ListNews extends StatelessWidget {
 
  final List<Article?> news;

  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: ( BuildContext context, int index){
        //return Text( this.news[index]?.title as String);
        return _News(news: this.news[index]!, index: index);
      },
    );
  }
}

class _News extends StatelessWidget { 

  final Article news;
  final int index;

  const _News({
    required this.news,
    required this.index});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopBarCard( news, index ),

        _TitleCard( news),

        _ImageCard( news ),

        _BodyCard( news ),

        _ButtonCard(),

        SizedBox(height: 10,),
        Divider(),


      ],
    );
  }
}

class _TitleCard extends StatelessWidget { 

  final Article news;

  const _TitleCard(this.news); //* POSICIONAL(sin llaves) = SOLO RECIBIREMOS LA NOTICIA

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text( news.title!, style: TextStyle( fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}

class _ImageCard extends StatelessWidget { 

  final Article news;

  const _ImageCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.only( topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (news.urlToImage != null)
          ? FadeInImage(
          placeholder: AssetImage('assets/img/giphy.gif') ,
          image: NetworkImage( news.urlToImage! ),)
          : Image( image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget { 

  final Article news;

  const _BodyCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text( (news.description != null) ? news.description!: ''),
    );
  }
}

class _ButtonCard extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          RawMaterialButton(
            onPressed: (){},
            fillColor: myTheme.colorScheme.secondary, //accentcolor
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
            child: Icon( Icons.star_border),
            ),

          SizedBox(width: 10,),

          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue, //accentcolor
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
            child: Icon( Icons.more),
            ),

          SizedBox(width: 10,),

          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.green, //accentcolor
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
            child: Icon( Icons.share),
            ),

        ],
      )
    );
  }
}

class _TopBarCard extends StatelessWidget { 

  final Article news;
  final int index;

  const _TopBarCard(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10),
      margin: EdgeInsets.only( bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}. ', style: TextStyle(color: myTheme.colorScheme.secondary) ,),
          Text('${ news.source!.name}. '),
        ],
      ),
    );
  }
}