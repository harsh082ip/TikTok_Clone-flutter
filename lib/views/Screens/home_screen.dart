import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/Screens/widgets/custom_add_icon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pgIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageIndex[pgIndex],
      ),

      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: bgColor,
        onTap: (index) {
          setState(() {
            pgIndex = index;
          });
        },
        currentIndex: pgIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 25,
              ),
              label: 'Search'),
          BottomNavigationBarItem(icon: CustomAddIcon(), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message_rounded,
                size: 25,
              ),
              label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 25,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
