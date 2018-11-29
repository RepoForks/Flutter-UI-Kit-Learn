import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final controller = StreamController<List<String>>();
    controller.add(["Hello", "World"]);
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<List<String>>(
          stream: controller.stream,
          builder: (context, stream) => CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 150,
                    backgroundColor: Colors.blueGrey,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: false,
                        title: Row(
                          children: <Widget>[Text("Bar title")],
                        ),
                        background: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black26, Colors.blueGrey])),
                        )),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) => InkWell(
                              onTap: () => print("this is index of $index"),
                              child: Container(
                                  color: Colors.blueGrey,
                                  child: Center(
                                    child: Text(
                                      "Child-$index",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                        childCount: 10),
                  )
                ],
              ),
        ),
      ),
    );
  }
}
