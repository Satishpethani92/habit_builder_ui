class HomeScreenDay {
  String? day;
  String? date;

  HomeScreenDay({this.day, this.date});
}

List<HomeScreenDay> dayDateData = [
  HomeScreenDay(day: 'SUN', date: '17'),
  HomeScreenDay(day: 'MON', date: '18'),
  HomeScreenDay(day: 'TUE', date: '19'),
  HomeScreenDay(day: 'WED', date: '20'),
  HomeScreenDay(day: 'THU', date: '21'),
  HomeScreenDay(day: ' FRI ', date: '22'),
  HomeScreenDay(day: 'SAT', date: '23'),
];

class Month {
  String? monthName;

  Month({this.monthName});
}

List<Month> monthName = [
  Month(monthName: 'January'),
  Month(monthName: 'February'),
  Month(monthName: 'March'),
  Month(monthName: 'April'),
  Month(monthName: 'May'),
  Month(monthName: 'Jane'),
  Month(monthName: 'July'),
  Month(monthName: 'August'),
  Month(monthName: 'September'),
  Month(monthName: 'October'),
  Month(monthName: 'November'),
  Month(monthName: 'December'),
];
