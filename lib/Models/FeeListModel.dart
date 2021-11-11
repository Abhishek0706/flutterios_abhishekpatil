class FeeListModel {
  String title;
  bool isCheck;

  FeeListModel(this.title, {this.isCheck = false});

  static List<FeeListModel> getFees() {
    return <FeeListModel>[
      FeeListModel("200"),
      FeeListModel("500"),
      FeeListModel("800"),
      FeeListModel("1000"),
    ];
  }
}
