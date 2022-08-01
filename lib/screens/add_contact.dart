import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:houzeo/db_helper/db_helper.dart';
import 'package:houzeo/res/app_strings.dart';
import 'package:houzeo/res/ui_helper.dart';
import 'package:houzeo/widget/app_text_field.dart';
import 'package:firebase_core/firebase_core.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController phone = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final databaseReference = FirebaseDatabase.instance.ref();

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0.0,
          icon: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.amber,
          label: Text(
            AppString.addCon,
            style: const TextStyle(fontSize: 12.0, color: Colors.black),
          ),
          onPressed: () {
            //_dashboardController.print();
            Get.to(() => const AddContact());
          }),
      appBar: AppBar(
        title: const Text('sqflite'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppTextField(
                controller: phone,
                hintText: "Phone number",
                keyboardType: TextInputType.phone,
              ),
              const C10(),
              AppTextField(
                controller: fName,
                hintText: "First Name",
                keyboardType: TextInputType.text,
              ),
              const C10(),
              AppTextField(
                controller: lName,
                hintText: "Last Name",
                keyboardType: TextInputType.text,
              ),
              const C10(),
              AppTextField(
                controller: email,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const C10(),
              AppTextField(
                controller: age,
                hintText: "Age",
                keyboardType: TextInputType.number,
              ),
              const C10(),
              ElevatedButton(
                onPressed: createRecord,
                child: const Text(
                  'insert',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createRecord() async {
    //FirebaseDatabase.instance.ref(phone.text);

    databaseReference.child(phone.text).set({
      'mobile': phone.text,
      'first_name': fName.text,
      'last_name': lName.text,
      'email': email.text,
      'age': age.text,
    });
  }
}
