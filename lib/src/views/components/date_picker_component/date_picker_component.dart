import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/extensions/date_time_extensions.dart';

class DatePickerComponent extends StatefulWidget {
  final String _labelText;
  final void Function(DateTime?) _onSelectDate;

  const DatePickerComponent(
      {super.key,
      required String labelText,
      required void Function(DateTime?) onSelectDate})
      : _labelText = labelText,
        _onSelectDate = onSelectDate;

  String getLabelText() => _labelText;

  Function(DateTime?) getOnSelectDate() => _onSelectDate;

  @override
  State<DatePickerComponent> createState() => _DatePickerComponentState();
}

class _DatePickerComponentState extends State<DatePickerComponent> {
  DateTime? _selectedDate;

  final TextEditingController _textFieldController = TextEditingController();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      setState(() => _selectedDate = selectedDate);
      _textFieldController.text = selectedDate?.toPtBrFormat() ?? '';
      widget.getOnSelectDate()(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.getLabelText(),
        ),
        enabled: false,
        controller: _textFieldController,
      ),
      onTap: () => _showDatePicker(),
    ));
  }
}
