import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _list = Data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              List _contentList = _list[index]['content'];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.amber,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      _list[index]['title'],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                        children: List.generate(_contentList.length, (index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _contentList[index]['articleName'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    })),
                  )
                ],
              );
            }));
  }
}
