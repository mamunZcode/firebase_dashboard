import 'package:flutter/material.dart';

class homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),

      body: Column(
        children: [
          Expanded(
            child: Center(child:
            Text('data'),
            ),
          ),
          // ElevatedButton(
          //     onPressed: (){
          //       Navigator.pushNamed(context,'/');
          // },
          //     child: Text('click it'))
        ],
      ),
    );
  }
}