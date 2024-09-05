// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

class CalendarEventsWidget extends StatefulWidget {
  const CalendarEventsWidget({super.key});

  @override
  State<CalendarEventsWidget> createState() => _CalendarEventsWidgetState();
}

class _CalendarEventsWidgetState extends State<CalendarEventsWidget> {
  DateTime _currentDate = DateTime(2019, 2, 3);
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 3);
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static final Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(1000)), border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  final EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2019, 2, 10): [
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        new DateTime(2019, 2, 25),
        new Event(
          date: new DateTime(2019, 2, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        new DateTime(2019, 2, 10),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(new DateTime(2019, 2, 11), [
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Example with custom icon

    /// Example Calendar Carousel without header and custom prev & next button
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      locale: 'pt',
      todayBorderColor: Colors.red,
      onDayPressed: (date, events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      weekdayTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      daysTextStyle: TextStyle(color: Colors.white),
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.white,
      ),
      // thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Define o raio das bordas
        side: BorderSide(color: Colors.white), // Define a cor e a largura da borda
      ),
      // CircleBorder(side: BorderSide(color: Colors.white)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.white,
      ),
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: Colors.white12,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.white.withOpacity(0.4),
      ),
      nextDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.white.withOpacity(0.4),
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //custom icon
          // This trailing comma makes auto-formatting nicer for build methods.
          //custom icon without header
          // Container(
          //   margin: EdgeInsets.only(
          //     // top: 30.0,
          //     bottom: 16.0,
          //     left: 16.0,
          //     right: 16.0,
          //   ),
          //   child: new Row(
          //     children: <Widget>[
          //       Expanded(
          //           child: Text(
          //         _currentMonth,
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 24.0,
          //         ),
          //       )),
          //       TextButton(
          //         child: Text('PREV'),
          //         onPressed: () {
          //           setState(() {
          //             _targetDateTime = DateTime(
          //                 _targetDateTime.year, _targetDateTime.month - 1);
          //             _currentMonth =
          //                 DateFormat.yMMM().format(_targetDateTime);
          //           });
          //         },
          //       ),
          //       TextButton(
          //         child: Text('NEXT'),
          //         onPressed: () {
          //           setState(() {
          //             _targetDateTime = DateTime(
          //                 _targetDateTime.year, _targetDateTime.month + 1);
          //             _currentMonth =
          //                 DateFormat.yMMM().format(_targetDateTime);
          //           });
          //         },
          //       )
          //     ],
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: _calendarCarouselNoHeader,
          ), //
        ],
      ),
    );
  }
}
