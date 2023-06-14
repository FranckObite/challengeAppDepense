import 'package:flutter/material.dart';
import 'models/classTabBar.dart';
import 'view/widgets/transport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<TabBarTabBar> tabBarr = [
    TabBarTabBar(
        categorie: "Transport", contenusCategories: const CategorieTransport()),
    TabBarTabBar(
        categorie: "Loisir",
        contenusCategories: Container(
          color: Colors.blue,
        )),
    TabBarTabBar(
        categorie: "Vivre",
        contenusCategories: Container(
          color: Colors.green,
        )),
    TabBarTabBar(
        categorie: "Divers",
        contenusCategories: Container(
          color: Colors.grey,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBarr.length,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[400],
            title: const Text("My App"),
            bottom: TabBar(
                indicatorColor: Colors.black,
                tabs: tabBarr
                    .map((e) => Tab(
                          text: e.categorie,
                        ))
                    .toList()),
          ),
          body: TabBarView(
              children: tabBarr
                  .map((e) => Tab(
                        child: e.contenusCategories,
                      ))
                  .toList())),
    );
  }
}
