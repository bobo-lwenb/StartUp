import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
      ),
      body: Center(
        child: GestureDetector(
          child: Text(selectDate.toString()),
          onTap: _showDatePicker,
        ),
      ),
    );
  }

  void _showDatePicker() async {
    DateTime dateTime = await showDatePicker(
      context: context,
      initialDate: selectDate,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.year,
      firstDate: DateTime(1990),
      lastDate: DateTime(2090),
    );
    if (dateTime == null) return;
    setState(() {
      selectDate = dateTime;
    });
  }
}
