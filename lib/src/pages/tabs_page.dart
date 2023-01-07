
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => _NavigationModel(),
      child: Scaffold(
         body: _Pages(),
         bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.actualPage ,// (ej:0 establece pag actual)
      //  	        ^v^v gracias al provider _NavigationModel definido se redibuja componente!
      onTap: (i) => navigationModel.actualPage = i, //print('$i')
      items: [
        BottomNavigationBarItem(icon: Icon( Icons.person_outline), label: ('For you') ),
        BottomNavigationBarItem(icon: Icon( Icons.public), label: ('Headlines') ),
      ]
      );
  }
}

class _Pages extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return PageView(
     //physics: BouncingScrollPhysics(), //*para hacer swipe entre pantallas
     physics: const NeverScrollableScrollPhysics(), //*bloquear swipe
     children: <Widget>[

       Container(
         color: Colors.red
       ),

       Container(
         color: Colors.green
       ),

     ]
    );
  }
}

//para comunicar widgets hijos entre si
//mas info en https://www.youtube.com/watch?v=-KX2rH0qdKA
class _NavigationModel with ChangeNotifier{ //<- para utilizar notifyListeners();

  int _actualPage = 0;

  int get actualPage => this._actualPage;

  set actualPage( int value){
    this._actualPage = value;
    notifyListeners(); //se debe añadir with ChangeNotifier
  }


}
