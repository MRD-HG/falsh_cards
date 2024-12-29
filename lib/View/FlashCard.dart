import 'package:flutter/material.dart';
class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  @override
  Widget build(BuildContext context) {
    return  Row(

      children:[
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(30),
            color: Colors.blueAccent,
            child:const Text("1"),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(30),
            color: Colors.grey,
            child:const Text("2"),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(30),
            color: Colors.orange,
            child:const Text("3"),
          ),
        ),

      ],
    );
  }
}
