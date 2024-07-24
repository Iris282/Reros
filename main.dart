import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_reros/screen/in_page.dart';
import 'package:project_reros/screen/main_page.dart';
import 'package:project_reros/screen/my_page.dart';
import 'package:project_reros/screen/talk_page.dart';
import 'package:project_reros/screen/todo_page.dart';

void main(){
  runApp((const MainFrame()));
}

class MainFrame extends StatelessWidget {
  const MainFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,

        ),
      ),
      home: Home_page(),
    );
  }
}

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  late int index;

  @override
  void initState(){
    super.initState();
    index = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('영남고의 모든 정보들', style: GoogleFonts.notoSans(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w700,),),
        centerTitle: false,
      ),
      body: Main_body(index: index),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (newindex){
          setState(()=> index = newindex);
        },
        currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.pending_actions, size: 35,), label: 'To Do', ),
            BottomNavigationBarItem(icon: Icon(Icons.question_answer, size: 35,), label: 'Talk'),
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 35,), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.developer_board, size: 35,), label: '영남지식IN'),
            BottomNavigationBarItem(icon: Icon(Icons.person, size: 35,), label: 'My Page',),
          ],
      ),
    );
  }
}

class Main_body extends StatelessWidget {
  final int index;

  const Main_body({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    if(index == 0){
      return todo_page();
    }

    if(index == 1){
      return talk_page();
    }
    if(index == 2){
      return main_page();
    }

    if(index == 3){
      return in_page();
    }

    if(index == 4){
      return my_page();
    }
    return main_page();
  }
}
