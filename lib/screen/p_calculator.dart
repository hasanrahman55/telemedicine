import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine/widget/pregtime.dart';

class PregnancyDueDate extends StatefulWidget {
  const PregnancyDueDate({Key? key}) : super(key: key);

  @override
  _PregnancyDueDateState createState() => _PregnancyDueDateState();
}

class _PregnancyDueDateState extends State<PregnancyDueDate> {
  var _finalDate;
  DateTime _nowDate = DateTime.now();

  var _formateDate;

  void _dateTimePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        _nowDate = value!;
        _formateDate = _nowDate.add(Duration(days: 280));
        _finalDate = DateFormat.yMMMd().format(_formateDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB69DF8),
        title: Center(
          child: Text(
            "Estimate Your Due Date",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
            // textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Color(0xffF6EDFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
                //   color: Color(0xffF6EDFF),
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const Text(
                  "Please enter first day of your last menstrual period ( LMP )",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff222222),
                    letterSpacing: 0.7,
                  ),
                  // textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),

                //Date picker button

                InkWell(
                  onTap: _dateTimePicker,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xffB69DF8)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // calendar Icon button

                          Container(
                            height: 40,
                            child: Image.asset(
                              'assets/icons/calendar.png',
                              color: Color(0xffd9a7c7),
                            ),
                          ),
                          SizedBox(width: 20),

                          //Text for date

                          Text(
                            DateFormat.yMMMd().format(_nowDate),
                            style: TextStyle(
                              fontSize: 35,
                              color: Color(0xffd9a7c7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                const Text(
                  "This is an estimated date of when your baby is due.Babiesrarely keep to an exact timetable,so your full-term pregnancy can be anywhere from 37 and 42 weeks",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff393C3E),
                      fontWeight: FontWeight.normal),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Calculate button.....

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PegnancyTime(
                          text: _finalDate,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      "Calculate My Due Date",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                    decoration: BoxDecoration(
                      color: Color(0xffB69DF8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
