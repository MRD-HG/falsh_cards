import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {


List _items=[];
Future<void> readJson() async{
  final String response = await rootBundle.loadString('assets/data.json');
  final data= await json.decode(response);
  setState(() {
    _items = data["data"];
  });
}
  @override
  void initState(){
  super.initState();
  readJson();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:_items.isNotEmpty
          ? ListView.builder(
          itemCount: _items.length,
          itemBuilder:(context, index)
          {
            final category = _items[index];
            return  Column(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Align(
                            alignment: Alignment.center,
                            child: Text(category['category'])
                        ),

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FlashCardDetails(cards:category['cards'])));
                        },
                        trailing:  Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  )
                ]

            );
          }
      )
    : const Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
class FlashCardDetails extends StatelessWidget {
  final List cards;
  const FlashCardDetails({required this.cards , super.key});

  @override
  Widget build(BuildContext context) {
    if (cards == null || cards.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('No cards available'),
        ),
      );
    }

    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return Card(
            child: ListTile(
              title: Text(card['question']),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) =>
                      AlertDialog(
                        title: const Text("Answer"),
                        content: Text(card['answer']),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                );
              },
            ),
          );
        },
      ),
    );
  }
  }