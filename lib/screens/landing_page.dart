import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandinPage extends StatelessWidget {
  const LandinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                bottom: 300,
              ),
              decoration: BoxDecoration(color: Colors.amberAccent),
            ),
            flex: 3,
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: Center(
              child: Text('data'),
            ),
          )
        ],
      ),
    );
  }
}
