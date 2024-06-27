import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))));
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        //...........Container er options kom
        // child: Container(
        //   padding: EdgeInsets.all(10),
        //   color: Color.fromRGBO(33, 191, 115, 1),
        //   height: 200,
        //   width: 200,
        //   child: Center(
        //     child: Text(
        //       'This is a Container',
        //       selectionColor: Colors.white,
        //     ),
        //   ),
        // ),
        child: Card(
            elevation: 10,
            shadowColor: Color.fromRGBO(33, 191, 115, 1),
            color: Color.fromRGBO(33, 191, 115, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('This is a Card',
                      style: GoogleFonts.playfairDisplay(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))),
                  Text('This is a Card',
                      style: GoogleFonts.akayaTelivigala(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))),
                  Text(
                    'This is a Card',
                    style: TextStyle(
                        fontFamily: 'Playwrite',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            )),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
