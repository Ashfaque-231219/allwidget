import 'package:flutter/material.dart';
class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  int _gender = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(

        decoration: BoxDecoration(


          borderRadius: BorderRadius.circular(25)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gender:",style: TextStyle(

              fontSize: 17
            ),),
            SizedBox(width: 10,),
            Text("Male",style: TextStyle(
              fontSize: 15,

            ),),
            Radio(
              value: 1,
              groupValue: _gender,
              onChanged: (value){
                setState(() {
                  _gender = 1;
                });

              },
            ),
            SizedBox(width: 10,),
            Text("Female",style:TextStyle(
              fontSize: 15,

            )),
            Radio(
              value: 2,
              groupValue: _gender,
              onChanged: (value){
                setState(() {
                  _gender = 2;
                });

              },
            ),
            SizedBox(width: 10,),
            Text("Others",style: TextStyle(
              fontSize: 15,

            ),),
            Radio(
              value: 3,
              groupValue: _gender,
              onChanged: (value){
                setState(() {

                  _gender =3;
                });

              },
            ),
          ],
        ),
      ),
    );
  }
}
