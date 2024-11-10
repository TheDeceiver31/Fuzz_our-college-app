import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:core';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false,
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
            ),
          ),
          SizedBox(height: 20),
          if (_selectedDay != null)
            Text(
              'Selected Day: ${_selectedDay!.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<String>>(
              future: _fetchEventsForDay(_selectedDay ?? DateTime.now()), // Fetch events asynchronously
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Failed to load events'));
                } else {
                  final events = snapshot.data ?? [];
                  if (events.isEmpty) {
                    return const Center(child: Text('No events on this day.'));
                  }
                  return ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(events[index]),
                        leading: const Icon(Icons.event),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<String>> _fetchEventsForDay(DateTime selectedDay) async {
    // Replace this with your backend API call to fetch events for `selectedDay`
    // For example:
    // final response = await http.get('your-api-url?date=${selectedDay.toIso8601String()}');
    // return parseEventsFromResponse(response);

    // Mocked example of events for demonstration
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    if (selectedDay.day  == 9) {
      return ["Initial evaluation", "Mid Evaluation","Project Presentation", "Sleep"];
    } else {
      return []; // No events for odd-numbered days in this example
    }
  }
}
