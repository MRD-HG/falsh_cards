import 'package:flutter/material.dart';
import 'package:falsh_cards/models/data.json';
class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: const Align(
                  alignment: Alignment.center,
                  child: Text("Sport")
                ),
                leading: const Icon(Icons.sports),
                onTap: (){},
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
          )
        ]

      ) ,
    );
  }
}
