// ignore_for_file: prefer_final_fields
import "package:shared_preferences/shared_preferences.dart";
import 'model/event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cultural_center/widgets/drawer.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Fields>> _events;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _provinceController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _events = {};
  }

  List<Fields> _getEventsfromDay(DateTime date) {
    return _events[date] ?? [];
  }

  @override
  void dispose() {
    _provinceController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Calendar"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Column(children: [
        TableCalendar(
          focusedDay: selectedDay,
          firstDay: DateTime(1990),
          lastDay: DateTime(2050),
          calendarFormat: format,
          onFormatChanged: (CalendarFormat format) {
            setState(() {
              format = format;
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
            // ignore: avoid_print
            print(focusedDay);
          },
          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
          },

          eventLoader: _getEventsfromDay,

          //To style the Calendar
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            selectedTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(
              color: Colors.purpleAccent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            defaultDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            weekendDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: true,
            titleCentered: true,
            formatButtonShowsNext: false,
            formatButtonDecoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
            ),
            formatButtonTextStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ..._getEventsfromDay(selectedDay).map(
          (Fields field) => Card(
            child: ListTile(
              title: Text(field.name),
              subtitle: Text(field.description),
              isThreeLine: true,
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Add Event"),
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                      controller: _provinceController,
                      decoration: const InputDecoration(
                          hintText: "Provinsi Indonesia")),
                  TextFormField(
                      controller: _nameController,
                      decoration:
                          const InputDecoration(hintText: "Nama Event")),
                  TextFormField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(hintText: "Deskripsi Event")),
                ]),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  if (_provinceController.text.isEmpty ||
                      _nameController.text.isEmpty ||
                      _descriptionController.text.isEmpty) {
                  } else {
                    if (_events[selectedDay] != null) {
                      _events[selectedDay]?.add(
                        Fields(
                            province: _provinceController.text,
                            name: _nameController.text,
                            date: selectedDay,
                            description: _descriptionController.text,
                            image: ""),
                      );
                    } else {
                      _events[selectedDay] = [
                        Fields(
                            province: _provinceController.text,
                            name: _nameController.text,
                            date: selectedDay,
                            description: _descriptionController.text,
                            image: ""),
                      ];
                    }
                  }
                  Navigator.pop(context);
                  _provinceController.clear();
                  _nameController.clear();
                  _descriptionController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: const Text("Add Event"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
