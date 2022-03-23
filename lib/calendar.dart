
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget{
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("My Application"),
        centerTitle: true,
      ),
      body: TableCalendar(focusedDay: selectedDay, firstDay: DateTime(1990), lastDay: DateTime(2050),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format){
        setState((){
          format = _format;
        });
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
        daysOfWeekVisible: true, onDaySelected: (DateTime selectDay,DateTime focusDay){
        setState(() {
          selectedDay = selectDay;
          focusedDay = focusDay;
        });
        print(focusedDay);
        },
        calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
            selectedTextStyle: TextStyle(color: Colors.white),
        ),

      ),
    );




















  }
}