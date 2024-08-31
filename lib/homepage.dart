import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<int> futurebuilder() async {
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future builder'),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: futurebuilder(),
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
          )
        ],
      ),
    );
  }
}
