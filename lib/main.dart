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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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

        curve:
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))));
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (_isTextButtonVisible)
                  TextButton(
                    onPressed: () {
                      MyAlertDialog("this is text Button", context);
                    },
                    child: Text('Text '),
                    style: buttonStyle,
                  ),
                OutlinedButton(
                    onPressed: () {
                      mySnackbar("This is Outline Button", context);
                    },
                    child: Text('Outline ')),
                ElevatedButton(
                    onPressed: () {
                      mySnackbar("This is Elevated Button", context);
                    },
                    child: Text('Elevate ')),
              ],
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  //color:Color.fromRGBO(191, 153, 200, 0.5),

                  ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app.
                // ...
                mySnackbar("This is Home", context);
              },
            ),
            ListTile(
              title: const Text('Address'),
              onTap: () {
                // Update the state of the app.
                // ...
                mySnackbar("This is Address", context);
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
