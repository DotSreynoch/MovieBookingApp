import 'package:flutter/material.dart';
import 'package:movie/constants/constants.dart';

class TimeSelector extends StatefulWidget {
  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int timeIntexSelected = 1;

  var time = [
    ["01.30", 20],
    ["06.30", 20],
    ["10.30", 20],
    ["11.30", 20],
    ["2.30", 20],
    ["4.30", 20]
  ];

  Widget _timeItem(String time, int price, bool active) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: appPadding * 0.75),
      decoration: BoxDecoration(
          border: Border.all(
        color: active ? primary : white,
        width: 1,
      ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                text: time,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: active ? primary : white,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' PM',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: active ? primary : white,
                    )
                  )
                ]
              )
          ),
          Text(
            "from \$$price",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: grey,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 17,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.035),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: index == 0 ? 32 : 0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    timeIntexSelected = index; // Ensure `timeIntexSelected` is declared as `int`
                  });
                },
                child: _timeItem(
                  time[index][0] as String, // Cast to String
                  time[index][1] as int, // Cast to String
                  index == timeIntexSelected,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
