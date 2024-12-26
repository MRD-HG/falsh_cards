import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import './View/Home.dart';
import './View/FlashCard.dart';
import './View/profile.dart';




void main() {
  runApp(const FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MainClass(),
    );
  }
  
}

class MainClass extends StatefulWidget {
   const MainClass({super.key});

  @override
  State<MainClass> createState() => _MainClassState();
}
class _MainClassState extends State<MainClass> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Home(),
    const FlashCard(),
    const Profile(),
  ];

  @override
  //the build Context help for build the app automatically hot reload in act  ion
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)
        ) ,

        title:  Text("FlashCardApp",style: GoogleFonts.poppins(
          color: Colors.purple,
          letterSpacing: 2.0,

        )),
        centerTitle: true,
      ),
      body:Container(
        child: _screens[_currentIndex],
      ),




      bottomNavigationBar:BottomNavigationBar(

        currentIndex: _currentIndex,
          onTap: (index){
          setState(() {
            _currentIndex=index;
          });
          },
          items:const [
           BottomNavigationBarItem(
               icon: Icon(Icons.home)
               ,label:"Home",

           ),
            BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label:"Category"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
          ],
        elevation: 10,
        backgroundColor: Colors.white,

      ) ,

    );
  }
}






