import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay selectTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Picker'),
      ),
      body: Center(
        child: GestureDetector(
          child: Text(selectTime.toString()),
          onTap: _showTimePicker,
        ),
      ),
    );
  }

  void _showTimePicker() async {
    TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );
    if (timeOfDay == null) return;
    setState(() {
      selectTime = timeOfDay;
    });
  }
}
