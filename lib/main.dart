import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calendar App',
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<MyHomePage>  {
  DateTime? selectedEvents;

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime.now())
        .then((selectDate) {
      if (selectDate == null) {
        return;
      }
      setState(() {
        selectedEvents = selectDate;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Application"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 38,
            ),
            const Text(
              "CALCULATE YOUR",
              style: TextStyle(fontSize: 32, color: Colors.yellowAccent),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.greenAccent,
              alignment: Alignment.center,
              child: const Text(
                "AGE",
                style: TextStyle(fontSize: (29), color: Colors.black),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            const Text(
              "IN YEARS,MONTHS,DAYS,MINUTES",
              style: TextStyle(fontSize: 25, color: Colors.yellowAccent),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed:_presentDatePicker,
              child: const Text(
                  "DATE PICKER",
                  style: TextStyle(fontSize: 30,color : Colors.white),
            ),

            ),
            SizedBox(
              height: 24,
            ),
            Text(selectedEvents != null
                ? selectedEvents.toString()
                : '',
              style: TextStyle(fontSize: 22, color: Colors.deepOrange),
            ),
          ],
        ),
      ),
    );
  }
}

