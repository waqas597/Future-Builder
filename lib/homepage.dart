import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<DateTime> futurebuilder() async {
    await Future.delayed(Duration(seconds: 5));
    return DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Future builder')),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                futurebuilder();
                setState(() {});
              },
              child: Text('Click')),
          FutureBuilder(
            future: futurebuilder(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return Text('somthing went wrong');
                }
              } else {
                return Text(snapshot.connectionState.toString());
              }
            },
          )
        ],
      ),
    );
  }
}
