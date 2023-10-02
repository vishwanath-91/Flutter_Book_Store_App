import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/sign_in/sign_in_page.dart';
import '../firebase_database/book_add/book_add_page.dart';
import '../firebase_database/book_search/book_search.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  PageController pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  Future<void> goToNextPage() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(children: [
          const DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      "https://images.ctfassets.net/vztl6s0hp3ro/2Zg9Mth4qC5EGGWHoJIy9T/3f0dbdf8884231a3e9e7998c514cc1fa/Unleash-employee-potential-with-personal-professional-development-examples.jpg"),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("vishwanath nishad"),
                      Text("om.vishwanath.91@gmail.com")
                    ],
                  ),
                )
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.folder),
            title: Text("My Folder"),
          ),
          const ListTile(
            leading: Icon(Icons.group),
            title: Text("shared with me"),
          ),
          const ListTile(
            leading: Icon(Icons.star),
            title: Text("starred"),
          ),
          const ListTile(
            leading: Icon(Icons.delete),
            title: Text("Trash"),
          ),
          const ListTile(
            leading: Icon(Icons.upload),
            title: Text("upload"),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.share),
            title: Text("share"),
          ),
          InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              goToNextPage();
            },
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ),
        ]),
      ),
      body: PageView(
        controller: pageController,
        children: const [Home(), BookAdd(), BookSearch()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Book Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
