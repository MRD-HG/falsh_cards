import 'package:flutter/material.dart';
import 'package:falsh_cards/quote.dart';
class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  List<Quote> quotes=[
    Quote(text: 'The greatest glory in living lies not in never falling, but in rising every time we fall.', author: 'Nelson Mandela'),
    Quote(text: 'The way to get started is to quit talking and begin doing', author: 'Walt Disney'),
    Quote(text: "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking", author: 'Steve Jobs'),

  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children:[
          Card(
            child: ListTile(),
          )
        ]

      ) ,
    );
  }
}
