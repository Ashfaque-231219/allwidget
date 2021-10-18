import 'package:flutter/material.dart';

import 'Dropdown.dart';
import 'Radio.dart';
class RegistraionPage extends StatefulWidget {
  const RegistraionPage({Key? key}) : super(key: key);

  @override
  _RegistraionPageState createState() => _RegistraionPageState();
}

class _RegistraionPageState extends State<RegistraionPage> {
  @override
  bool firstvalue = false;
  bool Secondvalue = false;
  String _name = "";
  String _email = "";
  String _phoneno = "";

  TextEditingController password = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();
  final formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.blue,Colors.white
                  ]
              )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text("Registration Form",style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: CircleAvatar(
                      radius: 55,
                      child: Image.asset("Images/login.png"),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(padding:const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(

                          hintText: "First Name",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      validator: (value) {
                        if (value!.isEmpty)  {
                          return "Please Enter Your Name";
                        }
                        if( value.length<=6){
                          return "Please Enter the Name Less Than Six Words";
                        }
                        else {
                          return null;
                        }
                      },
                      onSaved: (name) {
                        _name = "name";
                      },
                    ),

                  ),
                  SizedBox(height: 20,),
                  Padding(padding:const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType:TextInputType.text,
                      decoration: InputDecoration(

                        hintText: "Last Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),


                      ),
                      validator: (value) {
                        if (value!.isEmpty)   {
                          return "Please Enter  Name ";
                        }
                        if(value.length<=5){
                          return "Please Enter the Name of 5 Words only";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 5,),
                  Buttons(),
                  SizedBox(height: 20,),
                  Padding(padding:const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(

                          hintText: "Enter Your E-mail",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                        {
                          return "Please Enter the Valid email";

                        }
                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value))
                        {
                          return "Please Use @ For email";
                        }
                        else {
                          return null;
                        }
                      },
                      onSaved: (email) {
                        _email = "email";
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(padding:const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(

                          hintText: "Enter Your Nuumber",
                          prefixIcon: Icon(Icons.call),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                        {
                          return "Please Enter the Mobile Numbers";
                        }
                        if(value.length>=13){
                          return "Please Enter The Mobile No Less Than 13 Digit";
                        }
                        else {
                          return null;
                        }
                      },
                      onSaved: (email) {
                        _email = "email";
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(padding:const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(

                          hintText: "Enter Your Address",
                          prefixIcon: Icon(Icons.add_location_alt_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      validator: (value) {
                        if (value!.isEmpty)  {
                          return "Please Enter The Address ";
                        }
                        if( value.length<=50){
                          return "Please Enter The Address Less Than 50 Words";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(padding:const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(

                          hintText: "Enter Your City",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter The city";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Ddown(),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Are You Sure want to Submit Your Form",style: TextStyle(
                        fontSize: 15,

                      ),),
                      Checkbox(
                        checkColor: Colors.black,
                        activeColor: Colors.blue,
                        value: this.firstvalue,
                        onChanged: (bool?value){
                          setState(() {
                            this.firstvalue = value!;
                          });
                        },
                      ),
                      Checkbox(
                        checkColor: Colors.black,
                        activeColor: Colors.blue,
                        value: this.Secondvalue,
                        onChanged: (bool?value){
                          setState(() {
                            this.Secondvalue = value!;
                          });
                        },
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    setState(() {
                      if (formkey.currentState!.validate())
                      {
                        return ;
                      }
                      else
                      {
                        print("Unsuccessfull");

                      }
                    });

                  }, child: Text("Submit",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),

                    style: TextButton.styleFrom(
                        minimumSize: Size(180,50),
                        backgroundColor: Colors.blue,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )

                    ),
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
