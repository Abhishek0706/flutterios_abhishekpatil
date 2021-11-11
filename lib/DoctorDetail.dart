import 'package:flutterios_abhishekpatil/Doctor.dart';

List<Doctor> doctorDetail = [
  new Doctor(
    "Abhishek",
    22,
    "ear",
    "4.7",
    "Apna Clinic",
    '500',
    "male",
    ["Monday", "Tuesday", "Wednesday"],
  ),
  new Doctor(
    "Sanjeet",
    22,
    "ear",
    "4.5",
    "Uska Clinic",
    '800',
    "male",
    ["Monday", "Tuesday", "Wednesday"],
  ),
  new Doctor(
    "Naman",
    22,
    "heart",
    "2.3",
    "Kiska Clinic",
    '200',
    "female",
    ["Monday", "Tuesday", "Wednesday"],
  ),
  new Doctor(
    "Nishant",
    22,
    "heart",
    "3.5",
    "Iska Clinic",
    '400',
    "female",
    ["Monday", "Tuesday", "Wednesday"],
  ),
  new Doctor(
    "Devjeet",
    22,
    "bone",
    "5.3",
    "Konsa Clinic",
    '900',
    "other",
    ["Thursday", "Friday", "Saturday"],
  ),
  new Doctor(
    "Samyak",
    22,
    "bone",
    "5.2",
    "Accha Clinic",
    '250',
    "female",
    ["Thursday", "Friday", "Saturday"],
  ),
  new Doctor(
    "Devendra",
    22,
    "nose",
    "4.2",
    "Bekar Clinic",
    '500',
    "other",
    ["Thursday", "Friday", "Saturday"],
  ),
  new Doctor(
    "Harsh",
    22,
    "nose",
    "1.7",
    "Bada Clinic",
    '600',
    "male",
    ["Sunday"],
  ),
];

List<Doctor> getDoctorDetail(
  List<String> availability,
  String fees,
  List<String> speciality,
  List<String> gender,
) {
  List<Doctor> ret = doctorDetail;

  if (availability.length != 0) {
    for (var i in doctorDetail) {
      if (!check(i.availability, availability)) {
        ret.remove(i);
      }
    }
  }
  if (speciality.length != 0) {
    for (var i in doctorDetail) {
      if (!check([i.speciality], speciality)) {
        ret.remove(i);
      }
    }
  }
  if (gender.length != 0) {
    for (var i in doctorDetail) {
      if (!check([i.gender], gender)) {
        ret.remove(i);
      }
    }
  }

  if (fees.length != 0) {
    for (var i in doctorDetail) {
      if (int.parse(i.fees) > int.parse(fees)) ret.remove(i);
    }
  }

  return ret;
}

check(List<String> a, List<String> b) {
  Set<String> intersect = {};
  for (var i in a) intersect.add(i);
  for (var i in b) intersect.add(i);

  return intersect.length != (a.length + b.length);
}
