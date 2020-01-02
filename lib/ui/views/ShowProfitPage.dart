import 'package:flutter/material.dart';
import 'package:oop/ui/Widgets/DetailsCard.dart';
import 'package:oop/ui/Widgets/TimeSelector.dart';
import 'package:oop/core/GetProfit.dart';

class ShowProfitPage extends StatefulWidget {
  @override
  _ShowProfitPageState createState() => _ShowProfitPageState();
}

class _ShowProfitPageState extends State<ShowProfitPage> {
  static DateTime now = DateTime.now();
  DateTime startDate = DateTime(now.year - 300, now.month, now.day);
  DateTime endDate = now;

  _getData(DateTime startDate, DateTime endDate) async {
    List result = await Back().GetProfit(startDate, endDate);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TimePeriodSelector(
                startDate: startDate,
                endDate: endDate,
                onChanged: (pStartDate, pEndDate, _) {
                  setState(() {
                    startDate = pStartDate;
                    endDate = pEndDate;
                  });
                }),
            // FutureBuilder(
            // future: _getData(startDate, endDate),
            // builder: (context, snap) =>
            // DetailsCard(snap.data[0], snap.data[1]))
          ],
        ),
      ),
    );
  }
}