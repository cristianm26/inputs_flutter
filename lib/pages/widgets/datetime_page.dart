import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({Key? key}) : super(key: key);

  @override
  _DateTimePageState createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  DateTime _selectedDate = DateTime(2021, 12, 10);
  double _volume = 0;

  void _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  void _pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      // ignore: avoid_print
      print(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                onDateChanged: (value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
              ),
              Text(_selectedDate.toString()),
              TextButton(
                onPressed: () {
                  _selectDate;
                },
                child: Text(_selectedDate.toString()),
              ),
              TextButton(
                onPressed: () => _pickTime(),
                child: const Text("Show Time Picker"),
              ),
              CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (Duration duration) {}),
              Slider(
                min: 0,
                max: 100,
                divisions: 10,
                label: "${_volume.toStringAsFixed(1)}%",
                activeColor: Colors.redAccent,
                inactiveColor: Colors.grey,
                value: _volume,
                onChanged: (value) {
                  setState(() {
                    _volume = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
