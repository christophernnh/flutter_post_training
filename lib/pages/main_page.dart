import 'package:cn23_2_qualification/themes/dark_theme.dart';
import 'package:cn23_2_qualification/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:cn23_2_qualification/pages/garage_page.dart';
import 'package:cn23_2_qualification/pages/notification_page.dart';
import 'package:cn23_2_qualification/pages/explore_page.dart';
import 'package:cn23_2_qualification/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  final String username;

  MainPage({Key? key, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}


late List<Widget> pages;
class _MainPageState extends State<MainPage> {
  String headtitle = "Garage";
  int selectedPage = 0;
  bool isDarkMode = false;
  PopupMenuButton<void> _buildPopupMenu() {
    
  return PopupMenuButton<void>(
    itemBuilder: (context) {
      return [
        PopupMenuItem(
          child: ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              activeColor: Theme.of(context).colorScheme.primary,
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ),
        ),
      ];
    },
  );
}



  @override
  Widget build(BuildContext context) {
    pages = [
      const GaragePage(),
      const NotificationPage(),
      const ExplorePage(),
      ProfilePage(email: widget.username),
    ];
    return Theme(
      data: isDarkMode? darkTheme : lightTheme,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/toyotalogo.png',
                        fit: BoxFit.contain,
                        height: 45,
                    ),
                    Text("$headtitle", style: TextStyle(fontSize: 17, color: Colors.black87)),
                    Spacer(),
                ],
    
            ),
            actions: [
              Switch(
                activeColor: Theme.of(context).colorScheme.secondary,
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
    
    
            ],
        ),
        
        body: pages[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value){
            setState(() {
              selectedPage = value;
            });
            if(selectedPage == 0){
              headtitle = "Garage";
            }else if(selectedPage == 1){
              headtitle = "Notifications";
            }else if(selectedPage == 2){
              headtitle = "Explore";
            }
            else if(selectedPage == 3){
              headtitle = "Profile";
            }
          },
          
          currentIndex: selectedPage,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: isDarkMode ?Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 0, 0, 0),
    
          items: [
          BottomNavigationBarItem(
            // tooltip: "Garage",
            label: "Garage",
            icon: Icon(Icons.garage),
            activeIcon: Icon(Icons.garage_outlined),
          ),
          BottomNavigationBarItem(
            // tooltip: "Notifications",
            label: "Notifications",
            icon: Icon(Icons.notification_important),
            activeIcon: Icon(Icons.notification_important_outlined),
          ),
          BottomNavigationBarItem(
            // tooltip: "Explore",
            label: "Explore",
            icon: Icon(Icons.map),
            activeIcon: Icon(Icons.map_outlined),
          ),
          BottomNavigationBarItem(
            label: widget.username,
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person_outlined),
          ),
        ]),
      ),
    );
  }
}