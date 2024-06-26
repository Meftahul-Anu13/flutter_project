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
  var MyItems = [
    {
      'img':
          'data:image/jpeg;base64,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',
      'title': 'bunny'
    },
    {
      'img':
          'data:image/jpeg;base64,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',
      'title': 'hunny'
    },
    {
      'img':
          'data:image/jpeg;base64,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',
      'title': 'little bunny'
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKuLFz370Sccda3FoottAam-MtVpaJRynrh0x6FELosGZFAVRrrlc5xTVlVg&s',
      'title': 'panda'
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9JSAgcLV7eQYshcx3VlCVaftRDm6LMHNJbEegDu7hWo_RMArEDcO41ffY-Q&s',
      'title': 'cute panda'
    },
  ];

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
      //listview builder with dynamic view and gesture detector
      // body: ListView.builder(
      //     itemCount: MyItems.length,
      //     itemBuilder: (context, index) {
      //       return GestureDetector(
      //           onLongPress: () {mySnackbar(MyItems[index]['title'], context);},
      //           child: Container(
      //             margin: EdgeInsets.all(10),
      //             width: double.infinity,
      //             height: 250,
      //             child:
      //                 Image.network(MyItems[index]['img']!, fit: BoxFit.fill),
      //          padding: EdgeInsets.all(20),
      //
      //             // decoration: ,
      //           ));
      //     }),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            childAspectRatio: 1,
          ),
          itemCount: MyItems.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){mySnackbar(MyItems[index]['title'], context);},
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.maxFinite,
                height: 250,
                padding: EdgeInsets.all(5),
                child: Image.network(MyItems[index]['img']!),
              ),
            );
          }),
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
            DrawerHeader(
              decoration: BoxDecoration(
                  //color:Color.fromRGBO(191, 153, 200, 0.5),

                  ),
              child: Row(
                children: [
                  // Profile picture
                  CircleAvatar(
                    radius: 30, // Radius of the profile picture
                    backgroundImage: NetworkImage(
                      'https://marketplace.canva.com/EAFWqgieqss/1/0/1600w/canva-blue-and-peach-gradient-facebook-profile-picture-oBy0jAd4JFY.jpg',
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, size: 24), // Icon
                          SizedBox(
                              width: 5), // Space between the icon and the text
                          Text('My Profile', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                mySnackbar("This is Home", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: const Text('Address'),
              onTap: () {
                mySnackbar("This is Address", context);
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
