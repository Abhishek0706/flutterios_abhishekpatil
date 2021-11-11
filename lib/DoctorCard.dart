import 'dart:ui';

import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final int age;
  final String speciality;
  final String rating;
  final String clinic;
  final String fees;
  final String gender;
  final List<String> availability;

  DoctorCard(
    this.name,
    this.age,
    this.speciality,
    this.rating,
    this.clinic,
    this.fees,
    this.gender,
    this.availability,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: (Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 270,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  left: 5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.speciality + " Specialist",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "   |   ${this.rating}   ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Icon(
                          Icons.thumb_up_rounded,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(this.clinic,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.purple)),
                    Divider(height: 20, thickness: 3, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: null, icon: Icon(Icons.message_sharp)),
                        IconButton(
                            onPressed: null,
                            icon: Icon(Icons.video_call_sharp)),
                        IconButton(onPressed: null, icon: Icon(Icons.call)),
                        TextButton(
                          onPressed: null,
                          child: Text(
                            '\u{20B9}${this.fees}',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                color: Theme.of(context).backgroundColor.withOpacity(0.2),
              ),
            )),
          ),
        ),
        Positioned(
          top: 0,
          left: 25,
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage("assets/Doctor.jpg")),
              // image: new DecorationImage(
              //     fit: BoxFit.fill,
              //     image: Image.asset("assets/Doctor.jpg")))),
            ),
          ),
        ),
      ],
    );
  }
}
