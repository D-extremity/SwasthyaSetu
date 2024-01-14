import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  final Size size;
  const DoctorCard({super.key, required this.size});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.green.shade300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Dr. Deepak Sinha",
                style: TextStyle(
                    fontSize: widget.size.width / 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.amber.shade400),
                  child: Text(
                    "  3 Exp.",
                    style: TextStyle(fontSize: widget.size.width / 20),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Specializations : ",
                    style: TextStyle(
                        fontSize: widget.size.width / 25,
                        fontWeight: FontWeight.w500),
                  )),
              Text("[Dentist,ENT,Physician]",
                  style: TextStyle(
                      fontSize: widget.size.width / 25,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Address : ",
                    style: TextStyle(
                        fontSize: widget.size.width / 25,
                        fontWeight: FontWeight.w500),
                  )),
              Column(
                children: [
                  Text(
                      "Patel Nagar 2 , Chaudhary Chabbil Das \nCharitable Trust",
                      maxLines: 4,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: widget.size.width / 30,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
