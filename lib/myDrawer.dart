import 'package:flutter/material.dart';
import 'package:flutterios_abhishekpatil/Models/DayListModel.dart';
import 'package:flutterios_abhishekpatil/Models/FeeListModel.dart';
import 'package:flutterios_abhishekpatil/Models/GenderListModel.dart';
import 'package:flutterios_abhishekpatil/Models/SpecialityListModel.dart';

Drawer myDrawer(BuildContext context, Function applyfilter) {
  var dayList = DayListModel.getDays();
  var feeList = FeeListModel.getFees();
  var specialityList = SpecialityListModel.getSpecialities();
  var genderList = GenderListModel.getGenders();

  List<String> availability = [];

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 140,
          child: DrawerHeader(
            child: Row(
              children: [
                Icon(
                  Icons.filter_list_sharp,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Filters",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
        ExpansionTile(
          title: Text("Availability"),
          children: [
            for (var i in dayList)
              CheckboxListTile(
                value: i.isCheck,
                onChanged: null,
                title: Text(i.title),
              )
          ],
        ),
        ExpansionTile(
          title: Text("Fees"),
          children: [
            for (var i in feeList)
              CheckboxListTile(
                value: i.isCheck,
                onChanged: null,
                title: Text("Under " + i.title + "rs"),
              )
          ],
        ),
        ExpansionTile(
          title: Text("Speciality"),
          children: [
            for (var i in specialityList)
              CheckboxListTile(
                value: i.isCheck,
                onChanged: null,
                title: Text(i.title),
              )
          ],
        ),
        ExpansionTile(
          title: Text("Gender"),
          children: [
            for (var i in genderList)
              CheckboxListTile(
                value: i.isCheck,
                onChanged: null,
                title: Text(i.title),
              )
          ],
        ),
        Center(
          child: TextButton(
            onPressed: null,
            child: Text(
              'Clear Filter',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
