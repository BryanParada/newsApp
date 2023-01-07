import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _Pages(),
       bottomNavigationBar: _Navigation(),
    );
  }
}

class _Navigation extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
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