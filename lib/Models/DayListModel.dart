class DayListModel {
  String title;
  bool isCheck;

  DayListModel(this.title, {this.isCheck = false});

  static List<DayListModel> getDays() {
    return <DayListModel>[
      DayListModel("Monday"),
      DayListModel("Tuesday"),
      DayListModel("Wednesday"),
      DayListModel("Thursday"),
      DayListModel("Friday"),
      DayListModel("Saturday"),
      DayListModel("Sunday"),
    ];
  }
}
