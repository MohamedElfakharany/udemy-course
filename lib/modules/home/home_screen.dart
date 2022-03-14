import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: Menu,
        ),
        title: Text('welcome'),
        actions: [
          IconButton(onPressed: Search, icon: Icon(Icons.search)),
          IconButton(
            onPressed: Notification,
            icon: Icon(Icons.notifications_active_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(
                    'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.6),
                    width: 200.0,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Flower',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void Menu() {
    print('Menu Tabbed');
  }

  void Notification() {
    print('Notification tabbed');
  }

  void Search() {
    print('SearchTabbed');
  }
}
