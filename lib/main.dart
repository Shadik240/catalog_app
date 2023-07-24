import 'package:flutter/material.dart';
import 'package:second2/pages/Cart_page.dart';
import 'package:second2/pages/login_page.dart';
import 'package:second2/utils/routes.dart';
import 'package:second2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/store.dart';
import 'pages/home_page.dart';

//*******DEVELOPE By SK */

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),

      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage(),
      },
    );
  }
}


//7:43:40