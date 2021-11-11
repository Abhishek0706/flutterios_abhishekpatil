class SpecialityListModel {
  String title;
  bool isCheck;

  SpecialityListModel(this.title, {this.isCheck = false});

  static List<SpecialityListModel> getSpecialities() {
    return <SpecialityListModel>[
      SpecialityListModel("ear"),
      SpecialityListModel("heart"),
      SpecialityListModel("bones"),
      SpecialityListModel("muscles"),
    ];
  }
}
