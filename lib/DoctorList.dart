import 'package:flutter/material.dart';
import 'package:flutterios_abhishekpatil/Doctor.dart';
import 'package:flutterios_abhishekpatil/DoctorCard.dart';

Widget doctorList(BuildContext context, List<Doctor> _doctorDetail) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 280,
      margin: EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        itemCount: _doctorDetail.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: DoctorCard(
                  _doctorDetail[index].name,
                  _doctorDetail[index].age,
                  _doctorDetail[index].speciality,
                  _doctorDetail[index].rating,
                  _doctorDetail[index].clinic,
                  _doctorDetail[index].fees,
                  _doctorDetail[index].gender,
                  _doctorDetail[index].availability,
                ),
              ),
              SizedBox(width: 18),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    ),
  );
}
