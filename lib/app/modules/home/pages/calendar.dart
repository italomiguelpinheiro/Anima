import 'package:anima/app/modules/home/pages/Event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  
  

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: selectedDay,
      firstDay: DateTime(1990),
      lastDay: DateTime(2050),
      calendarFormat: format,
      onFormatChanged: (CalendarFormat _format) {
        setState(() {
          format = _format;
        });
      },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekVisible: true,
    
      //Day Changed
      onDaySelected: (DateTime selectDay, DateTime focusDay) {
        setState(() {
          selectedDay = selectDay;
          focusedDay = focusDay;
        });
        print(focusedDay);
      },
      selectedDayPredicate: (DateTime date) {
        return isSameDay(selectedDay, date);
      },

    
      //To style the Calendar
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
          color: Color(0xff2CB289),
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
        todayDecoration: BoxDecoration(
          color: Color(0xff2CB289).withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: true,
        titleCentered: true,
        formatButtonShowsNext: false,
        formatButtonDecoration: BoxDecoration(
          color: Color(0xff2CB289),
          borderRadius: BorderRadius.circular(5.0),
        ),
        formatButtonTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
