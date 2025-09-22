import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Enhanced Lottie Demo",
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.pink.shade50,
      ),
      home: LottiePage(),
    );
  }
}

class LottiePage extends StatefulWidget {
  @override
  _LottiePageState createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  final List<Color> card1Colors = [
    Colors.pink.shade200,
    Colors.green.shade200,
    Colors.orange.shade200,
    Colors.purple.shade200,
    Colors.yellow.shade200,
  ];
  final List<Color> card2Colors = [
    Colors.blue.shade200,
    Colors.red.shade200,
    Colors.teal.shade200,
    Colors.amber.shade200,
    Colors.cyan.shade200,
  ];
  final List<Color> card3Colors = [
    Colors.orange.shade200,
    Colors.brown.shade200,
    Colors.indigo.shade200,
    Colors.lime.shade200,
    Colors.grey.shade300,
  ];
  final List<Color> card4Colors = [
    Colors.teal.shade200,
    Colors.pink.shade100,
    Colors.deepPurple.shade200,
    Colors.lightBlue.shade200,
    Colors.greenAccent.shade100,
  ];

  int card1Index = 0;
  int card2Index = 0;
  int card3Index = 0;
  int card4Index = 0;

  late Color card1Color;
  late Color card2Color;
  late Color card3Color;
  late Color card4Color;

  int? selectedCard;
  bool showText = false;

  @override
  void initState() {
    super.initState();
    card1Color = card1Colors[0];
    card2Color = card2Colors[0];
    card3Color = card3Colors[0];
    card4Color = card4Colors[0];
  }

  void changeColors() {
    setState(() {
      if (selectedCard == 1) {
        card1Index = (card1Index + 1) % card1Colors.length;
        card1Color = card1Colors[card1Index];
      } else if (selectedCard == 2) {
        card2Index = (card2Index + 1) % card2Colors.length;
        card2Color = card2Colors[card2Index];
      } else if (selectedCard == 3) {
        card3Index = (card3Index + 1) % card3Colors.length;
        card3Color = card3Colors[card3Index];
      } else if (selectedCard == 4) {
        card4Index = (card4Index + 1) % card4Colors.length;
        card4Color = card4Colors[card4Index];
      }
    });
  }

  void hideText() {
    setState(() {
      showText = false;
      selectedCard = null;
    });
  }

  Widget buildCard({
    required int cardId,
    required Color color,
    required String title,
    required String url,
    required Color textColor,
  }) {
    final bool isSelected = selectedCard == cardId;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCard = cardId;
          showText = true;
        });
      },
      child: AnimatedScale(
        scale: isSelected ? 1.05 : 0.95,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.network(url, height: 120, repeat: true),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getColorName(Color color) {
    if (color == Colors.pink.shade200) return "Pink";
    if (color == Colors.green.shade200) return "Green";
    if (color == Colors.orange.shade200) return "Orange";
    if (color == Colors.purple.shade200) return "Purple";
    if (color == Colors.yellow.shade200) return "Yellow";
    if (color == Colors.blue.shade200) return "Blue";
    if (color == Colors.red.shade200) return "Red";
    if (color == Colors.teal.shade200) return "Teal";
    if (color == Colors.amber.shade200) return "Amber";
    if (color == Colors.cyan.shade200) return "Cyan";
    if (color == Colors.brown.shade200) return "Brown";
    if (color == Colors.indigo.shade200) return "Indigo";
    if (color == Colors.lime.shade200) return "Lime";
    if (color == Colors.grey.shade300) return "Grey";
    if (color == Colors.pink.shade100) return "Light Pink";
    if (color == Colors.deepPurple.shade200) return "Deep Purple";
    if (color == Colors.lightBlue.shade200) return "Light Blue";
    if (color == Colors.greenAccent.shade100) return "Light Green";
    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideText,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("LOTTIE Animations"),
          centerTitle: true,
          backgroundColor: Colors.green.shade700,
          elevation: 6,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedCard != null && showText)
                AnimatedOpacity(
                  opacity: showText ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 400),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "The card color is ${selectedCard == 1 ? getColorName(card1Color) : selectedCard == 2 ? getColorName(card2Color) : selectedCard == 3 ? getColorName(card3Color) : getColorName(card4Color)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              
              Row(
                children: [
                  Expanded(
                    child: buildCard(
                      cardId: 1,
                      color: card1Color,
                      title: "Stay Safe",
                      url:
                          'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
                      textColor: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: buildCard(
                      cardId: 2,
                      color: card2Color,
                      title: "Sanitizer",
                      url:
                          'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
                      textColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: buildCard(
                      cardId: 3,
                      color: card3Color,
                      title: "Wash Hands",
                      url:
                          'https://assets9.lottiefiles.com/packages/lf20_tutvdkg0.json',
                      textColor: Colors.deepOrange,
                    ),
                  ),
                  Expanded(
                    child: buildCard(
                      cardId: 4,
                      color: card4Color,
                      title: "Wear Mask",
                      url:
                          'https://assets2.lottiefiles.com/packages/lf20_xlkxtmul.json',
                      textColor: Colors.teal.shade900,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              if (selectedCard != null)
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: ElevatedButton.icon(
                    key: ValueKey(selectedCard),
                    onPressed: changeColors,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: const Icon(Icons.color_lens, color: Colors.white),
                    label: const Text(
                      "Change Card Colors",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
