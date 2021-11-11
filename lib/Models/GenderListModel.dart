class GenderListModel {
  String title;
  bool isCheck;

  GenderListModel(this.title, {this.isCheck = false});

  static List<GenderListModel> getGenders() {
    return <GenderListModel>[
      GenderListModel("male"),
      GenderListModel("female"),
      GenderListModel("other"),
    ];
  }
}
