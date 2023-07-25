import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application Krouss',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const WagnLime(title: 'Application Krouss'),
    );
  }
}

class WagnLime extends StatefulWidget {
  const WagnLime({super.key, required String title});

  @override
  State<WagnLime> createState() => _WagnLimeState();
}

class _WagnLimeState extends State<WagnLime>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var count = 0;

  reinit() {
    setState(() {
      count = 0;
    });
  }

  increment() {
    setState(() {
      count++;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Application Krouss"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => {reinit()},
                icon: Icon(
                  Icons.refresh,
                  size: 30,
                ))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: increment,
                icon: Icon(Icons.add),
                style: ButtonStyle(
                    iconColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blueAccent)),
              ),
              Divider(height: 60),
              Text(
                "$count",
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
        ));
  }
}
