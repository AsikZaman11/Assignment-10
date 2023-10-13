import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = ['item 1', 'item 2', 'item 3', 'item 4', 'item 5'];
  bool itemColor = true;
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Selected Item'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Number of selected items ${count}'),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close')),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.arrow_right),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: itemColor ? null : Colors.blue,
            onTap: () {
              itemColor = false;
              count++;
            },
            title: Text('${items[index]}'),
          );
        },
      ),
    );
  }
}
