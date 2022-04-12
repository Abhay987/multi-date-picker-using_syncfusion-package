import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime=DateTime.now();
  DateRangePickerController controller=DateRangePickerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
          title: const Text(
        "Date Picker",
        style: TextStyle(color: Colors.black),
      )),
      body: Container(
        height: 500,
        child: SfDateRangePicker(
          backgroundColor: Colors.white,
          view: DateRangePickerView.month,
          startRangeSelectionColor: Colors.green,
          monthViewSettings: const DateRangePickerMonthViewSettings(
            weekendDays: [6,7],
              viewHeaderStyle:DateRangePickerViewHeaderStyle(
                  textStyle: TextStyle(fontSize: 20,)) ),
          selectionShape: DateRangePickerSelectionShape.rectangle,
          selectionMode: DateRangePickerSelectionMode.range,
          toggleDaySelection: false,
          //todayHighlightColor: Colors.white,
          controller: controller,
          //onSelectionChanged: _onSelectionChanged,
          showActionButtons: true,

          onSubmit: (Object? val) {
             print(val);
          },
          headerStyle: const DateRangePickerHeaderStyle(
             //backgroundColor: Color(0xFF7fcd91),
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 25,
                letterSpacing: 5,
                color: Colors.black,
              )),
          onCancel: (){
            controller.selectedRange=null;
            },
          minDate: DateTime(dateTime.year,dateTime.month,dateTime.day+1),
            maxDate: DateTime(dateTime.year,dateTime.month+1,dateTime.day),
          //maxDate: DateTime.now(),

        ),
      ),
    ));
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    print(dateRangePickerSelectionChangedArgs.value);
  }
}
