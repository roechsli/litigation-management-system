import 'package:flutter/material.dart';
import 'package:litigation_management_system/screens/dashboard.dart';
import 'package:litigation_management_system/screens/new_litigation_screen.dart';
import 'package:litigation_management_system/screens/table_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Litigation Management System'),
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
  int currentPageIndex = 0;

  List<Widget> screens = [const DashboardScreen(), const TableViewScreen()];

  void doNothing() {}

  void doSomething() {
    // Ask for New Survey
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const NewLitigationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          // indicatorColor: Colors.amber[800],
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(Icons.business),
              label: 'Litigations',
            ),
          ],
        ),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: screens[currentPageIndex],
        floatingActionButton: (currentPageIndex == 1)
            ? FloatingActionButton(
                onPressed: doSomething,
                tooltip: 'New Claim',
                child: const Icon(Icons.add),
              )
            : null // This trailing comma makes auto-formatting nicer for build methods.

        );
  }
}
