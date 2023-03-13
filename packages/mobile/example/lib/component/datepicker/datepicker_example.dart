import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroDatePickerExample extends StatelessWidget {
  const ZeroDatePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date Picker')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ZeroDatePickerDocked(
              inputDecorationType: InputDecorationType.outline,
              firstDate:
                  DateTime.now().subtract(const Duration(days: 365 * 10)),
              lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
              initialDate: DateTime.now(),
              onDateChanged: (dateTime) {},
              style: ZeroDatePickerStyle(
                  pickerBackgroundColor: Colors.red,
                  headerBackgroundColor: Colors.yellow,
                  helpTextStyle: const TextStyle(color: Colors.white),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  dateTextStyle:
                      const TextStyle(fontSize: 30, color: Colors.white),
                  entryModeIconColor: Colors.white,
                  calendarStyle: const ZeroCalendarPickerStyle(
                      dayTextStyle: TextStyle(color: Colors.white),
                      selectedDayColor: Colors.orange,
                      selectedDayBackground: Colors.white,
                      controlColor: Colors.white,
                      inactiveControlColor: Colors.blue,
                      disabledDayColor: Colors.grey,
                      enabledDayColor: Colors.white,
                      headerTextStyle: TextStyle(color: Colors.white),
                      monthListTileStyle:
                          ZeroListTileStyle(backgroundColor: Colors.yellow),
                      monthLeftIcon: Icon(Icons.check_box),
                      yearListTileStyle:
                          ZeroListTileStyle(backgroundColor: Colors.yellow)),
                  textfieldStyle: ZeroTextfieldStyle.rounded(
                    focusedBorderColor: Colors.blue,
                    focusedColor: Colors.blue,
                    textfieldSize: ZeroTextfieldSize.large,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ZeroButton.primary(
                child: const Text('Date Picker'),
                onPressed: () async {
                  showZeroDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365 * 10)),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                    style: ZeroDatePickerStyle(
                        pickerBackgroundColor: Colors.red,
                        headerBackgroundColor: Colors.yellow,
                        helpTextStyle: const TextStyle(color: Colors.white),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        dateTextStyle:
                            const TextStyle(fontSize: 30, color: Colors.white),
                        entryModeIconColor: Colors.white,
                        calendarStyle: const ZeroCalendarPickerStyle(
                            dayTextStyle: TextStyle(color: Colors.white),
                            selectedDayColor: Colors.orange,
                            selectedDayBackground: Colors.white,
                            controlColor: Colors.white,
                            disabledDayColor: Colors.grey,
                            enabledDayColor: Colors.white,
                            headerTextStyle: TextStyle(color: Colors.white)),
                        textfieldStyle: ZeroTextfieldStyle.rounded(
                          focusedBorderColor: Colors.blue,
                          focusedColor: Colors.blue,
                          textfieldSize: ZeroTextfieldSize.large,
                        )),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ZeroButton.primary(
                child: const Text('Date Range Picker'),
                onPressed: () async {
                  showZeroDateRangePicker(
                    context: context,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365 * 10)),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                    style: const ZeroDatePickerStyle(
                      pickerBackgroundColor: Colors.black,
                      headerBackgroundColor: Colors.black,
                      dateTextStyle: TextStyle(fontSize: 30),
                      insetPadding: EdgeInsets.all(30),
                      entryModeIconColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            ZeroDatePickerDocked(
              inputDecorationType: InputDecorationType.outline,
              firstDate:
                  DateTime.now().subtract(const Duration(days: 365 * 10)),
              lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
              initialDate: DateTime.now(),
              onDateChanged: (dateTime) {},
            ),
            const SizedBox(
              height: 20,
            ),
            ZeroButton.primary(
                child: const Text('Date Picker'),
                onPressed: () async {
                  showZeroDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365 * 10)),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ZeroButton.primary(
                child: const Text('Date Picker'),
                onPressed: () async {
                  showZeroDateRangePicker(
                    context: context,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365 * 10)),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
