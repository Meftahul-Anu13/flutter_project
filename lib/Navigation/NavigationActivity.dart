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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isTextButtonVisible = true;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 2;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    String message;
    switch (index) {
      case 0:
        message = 'Home selected';

        break;
      case 1:
        message = 'School selected';

        Curves.easeOut;
        break;
      case 2:
        message = 'Settings selected';

        break;
      default:
        message = 'Unknown selection';

        break;
    }

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(milliseconds: 100),
        ),
      );
  }

  mySnackbar(msg, context) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(msg),
          duration: Duration(milliseconds: 100),
        ),
      );
  }

  MyAlertDialog(msg, context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: Text("Alert!...."),
            content: Text("Do u sure want to delete it ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    mySnackbar("yes, deleted", context);
                    setState(() {
                      _isTextButtonVisible = false;
                    });
                    null;
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
            ],
          ));
        });
  }

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(100),
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home!'),
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Activity1("This is from Home to page 1")));
                    },
                    child: Text('Go to Page1')),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Activity2("This is from Home to page 2")));
                    },
                    child: Text('Go to Page2'))
              ],
            )
          ],
        ));
  }
}

class Activity1 extends StatelessWidget {
  String msg;
   Activity1(
      this.msg,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(msg),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Activity2("This is from page 1")));
                    },
                    child: Text('Go to Page2'))
              ],
            )
          ],
        ));
  }
}

class Activity2 extends StatelessWidget {
  String msg;
  Activity2(
      this.msg,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(msg),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Activity1("This is from page 2")));
                    },
                    child: Text('Go to Page1')),
              ],
            )
          ],
        ));
  }
}
