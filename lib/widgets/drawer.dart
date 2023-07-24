// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final  imageUrl = "";
    // "https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F4%2F48%2FOutdoors-man-portrait_%2528cropped%2529.jpg%2F1200px-Outdoors-man-portrait_%2528cropped%2529.jpg&tbnid=q9uxtYqN4v1zHM&vet=12ahUKEwiV5du_iJGAAxWUrGMGHeTjDlkQMygGegUIARDYAQ..i&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FMan&docid=DOVv0vUvlvQB7M&w=1200&h=1498&q=men%20pic&ved=2ahUKEwiV5du_iJGAAxWUrGMGHeTjDlkQMygGegUIARDYAQ";
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                //margin: EdgeInsets.zero,
                accountName: Text("Md Sadik"),
                accountEmail: Text("sksadik@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/pics.jpg"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Mail",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
