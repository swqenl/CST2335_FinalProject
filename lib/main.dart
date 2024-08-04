import 'package:flutter/material.dart';
import 'FlightsList.dart';
import 'AddFlight.dart';
import 'Flight.dart';
import 'UpdateOrDeleteFlight.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CST2335_FinalProject',
      initialRoute: '/',
      routes: {'/FlightsList': (context) => const FlightsList()},
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Final Project'),
      onGenerateRoute: (settings) {
        if (settings.name == '/AddFlight') {
          final Function(String, String, String, String) onSubmit = settings.arguments as Function(String, String, String, String);
          return MaterialPageRoute(builder: (context) {
            return AddFlight(onSubmit: onSubmit);
          });
        } else if (settings.name == '/UpdateOrDeleteFlight') {
          final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
          final Flight selectedFlight = args['selectedFlight'] as Flight;
          final Function(String, String, String, String) onUpdate = args['onUpdate'] as Function(String, String, String, String);
          final VoidCallback onDelete = args['onDelete'] as VoidCallback;
          return MaterialPageRoute(builder: (context) {
            return UpdateOrDeleteFlight(
              selectedFlight: selectedFlight,
              onUpdate: onUpdate,
              onDelete: onDelete,
            );
          });
        }
        return null;
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/FlightsList');}, child: const Text('Flights Page'))
          ],
        ),
      ),
    );
  }
}