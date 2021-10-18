import 'package:flutter/material.dart';

class Ddown extends StatefulWidget {
  const Ddown({Key? key}) : super(key: key);

  @override
  _DdownState createState() => _DdownState();
}

class _DdownState extends State<Ddown> {
  String dropdownValue = "Assam";
  var listitem = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli',
    'Daman and Diu',
    'Delhi',
    'Lakshadweep',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(20)
        ),
        child: DropdownButton<String>(
          hint: Text("Select State"),
          value: dropdownValue,
          // icon: const Icon(Icons.arrow_downward),
          isExpanded: true,

          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: SizedBox(),
          dropdownColor: Colors.white,

          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: listitem
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
