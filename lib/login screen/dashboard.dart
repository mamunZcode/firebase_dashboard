import 'package:flutter/material.dart';

class dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Amount',style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),),
                            Text('\$1000.00', style: TextStyle(fontSize: 24)),
                          ],
                        ),
                        Icon(Icons.attach_money),
                      ],
                    ),
                  ),
                  color: Colors.pinkAccent,
                  elevation: 4,
                ),
              ),
              Expanded(child:
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Amount',style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),),
                          Text('\$1000.00', style: TextStyle(fontSize: 24)),
                        ],
                      ),
                      Icon(Icons.attach_money),
                    ],
                  ),
                ),
                color: Colors.blueAccent,
                elevation: 4,
              )
              ),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Amount',style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),),
                            Text('\$1000.00', style: TextStyle(fontSize: 24)),
                          ],
                        ),
                        Icon(Icons.attach_money),
                      ],
                    ),
                  ),
                  color: Colors.yellow,
                  elevation: 4,
                ),
              ),
              Expanded(child:
              Card(
                color: Colors.orangeAccent,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Amount', style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      )),
                      Text('\$1000.00', style: TextStyle(fontSize: 24, color: Colors.white)),
                    ],
                  ),
                ),
              )
              ),
            ],
          )
        ],
      ),
    );
  }
}