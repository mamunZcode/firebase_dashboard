import 'package:flutter/material.dart';

import 'listtilecustom.dart';


class Sidemenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Opacity(
                opacity: 1.0,
                child: Image(
                  image: AssetImage('assets/list.png'),
                ),
              ),
            ),
            ListTileCustom(
              image: 'assets/list.png',
              title: 'dashboard',
              press: () {},
              color: Colors.red,
            ),
            ListTileCustom(
              image: 'assets/love2.png',
              title: 'dashboard2',
              press: () {},
              color:Colors.green ,
            ),
            ListTileCustom(
              image: 'assets/love2.png',
              title: 'dashboard3',
              press: () {},
              color: Colors.yellow,
            ),
            ListTileCustom(
              image: 'assets/love2.png',
              title: 'dashboard4',
              press: () {},
              color: Colors.orange,
            ),
            ListTileCustom(
              image: 'assets/love2.png',
              title: 'dashboard5',
              press: () {},
              color: Colors.pink,
            ),
            ListTileCustom(
              image: 'assets/love2.png',
              title: 'dashboard6',
              press: () {},
              color: Colors.purple,
            ),
            ListTileCustom(
              image: 'assets/love2.png',
              title: 'dashboard7',
              press: () {},
              color: Colors.yellowAccent ,
            ),
          ],
        ),
      ),
    );
  }
}
