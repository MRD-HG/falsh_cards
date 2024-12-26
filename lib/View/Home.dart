import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text("data"),
          ElevatedButton(onPressed: (){}, child: const Text('Click Here')),
          Container(
            color: Colors.blueAccent,
            child:const Text("start here"),
          ),


        ],
      ),
    );
  }
}
