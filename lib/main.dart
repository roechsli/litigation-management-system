import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:litigation_management_system/screens/claim_view.dart';
import 'package:litigation_management_system/screens/dashboard.dart';
import 'package:litigation_management_system/screens/new_litigation_screen.dart';
import 'package:litigation_management_system/screens/table_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void main() {
// Add this
  if (kIsWeb) {
    WebViewPlatform.instance = WebWebViewPlatform();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return child ?? Container();
      },
      title: 'LMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Custom Litigation Management'),
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

  List<Widget> screens = [DashboardScreen(), TableViewScreen(key: tableViewKey), EditClaimScreen()];
  // Reference to TableViewScreen's state


 void doSomething() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => const NewLitigationScreen()));
    
    // After navigating back from NewLitigationScreen, call updateData to refresh the TableViewScreen.
    if (currentPageIndex == 1) {
      var screen = (screens[1] as TableViewScreen);
      tableViewKey.currentState?.updateData();
    }
    
    setState(() {
      
    });
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
            NavigationDestination(
              icon: Icon(Icons.account_balance),
              label: 'View Claim',
            ),
          ],
        ),
        appBar: AppBar(
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
