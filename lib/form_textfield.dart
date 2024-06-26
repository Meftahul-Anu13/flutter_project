import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
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
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller_name = TextEditingController();
  String text = '';
  String text_name = '';
  String submittedText = '';
  String submittedName = '';
  void _incrementCounter() {
    setState(() {
      _counter += 2;
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

  void mySnackbar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(msg),
          duration: Duration(milliseconds: 100),
        ),
      );
  }

  void MyAlertDialog(String msg, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert!...."),
          content: Text("Do you sure want to delete it?"),
          actions: [
            TextButton(
              onPressed: () {
                mySnackbar("Yes, deleted", context);
                setState(() {
                  _isTextButtonVisible = false;
                });
                //null;
                Navigator.of(context).pop();
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(20),
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
    // final TextEditingController _controller = TextEditingController();

    // String text = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _controller_name,
              onChanged: (value) => setState(() => text_name = value),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _controller,
              onChanged: (value) => setState(
                  () => text = value), // change `text` every text input change
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
          ),
          Padding(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  submittedName = text_name;
                  submittedText = text;
                });
                mySnackbar("You submitted", context);
              },
              child: Text('Submit'),
              style: buttonStyle,
            ),
            padding: EdgeInsets.all(5),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                mySnackbar(submittedName, context);
              },
              child: Text(submittedName.isEmpty ? 'Show Name' : submittedName),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                mySnackbar(submittedText, context);
              },
              child: Text(submittedText.isEmpty ? 'Show Email' : submittedText),
            ),
          ),
        ],
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
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                mySnackbar("This is Home", context);
              },
            ),
            ListTile(
              title: const Text('Address'),
              onTap: () {
                mySnackbar("This is Address", context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
