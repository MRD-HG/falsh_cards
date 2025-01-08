import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);
    setState(() {
      _items = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlashCards"),
      ),
      body: _items.isNotEmpty
          ? ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final category = _items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Align(
                  alignment: Alignment.center,
                  child: Text(category['category']),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlashCardDetails(
                        cards: category['cards'] ?? [],
                      ),
                    ),
                  );
                },
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
          );
        },
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class FlashCardDetails extends StatefulWidget {
  final List cards;

  const FlashCardDetails({required this.cards, super.key});

  @override
  State<FlashCardDetails> createState() => _FlashCardDetailsState();
}

class _FlashCardDetailsState extends State<FlashCardDetails> {
  int currentIndex = 0;
  bool showAnswer = false;

  void nextCard() {
    setState(() {
      if (currentIndex < widget.cards.length - 1) {
        currentIndex++;
        showAnswer = false;
      }
    });
  }

  void previousCard() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        showAnswer = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentCard = widget.cards[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("FlashCards"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4.0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showAnswer = !showAnswer;
                    });
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      showAnswer ? currentCard['answer'] : currentCard['question'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: previousCard,
                    child: const Text("Previous"),
                  ),
                  ElevatedButton(
                    onPressed: nextCard,
                    child: const Text("Next"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
