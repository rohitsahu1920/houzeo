import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:houzeo/res/app_strings.dart';
import 'package:houzeo/res/methods.dart';
import 'package:houzeo/res/ui_helper.dart';
import 'package:houzeo/screens/add_contact.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getUsers();
      setState(() {});
    });
  }

  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0.0,
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blueAccent,
          label: Text(
            AppString.addCon,
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          onPressed: () {
            //_dashboardController.print();
            Get.to(() => const AddContact());
          }),
      appBar: AppBar(
        title: const Text('Contact Details'),
        actions: [
          IconButton(
              onPressed: () async {
                list.clear();
                getUsers();
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: list.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (BuildContext con, int index) {
                  return InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              children: [
                                const C10(),
                                const Icon(Icons.person_outline),
                                const C10(),
                                Text("${index + 1}"),
                                const C20(),
                                Text(list[index]),
                                const Spacer(),
                                IconButton(
                                    onPressed: () async {
                                      launchUrl(Uri.parse("tel:022-62913758"));
                                    },
                                    icon: const Icon(Icons.phone)),

                                IconButton(
                                    onPressed: () async {
                                      removeContact(list[index]);
                                    },
                                    icon: const Icon(Icons.remove_circle))
                              ],
                            ),
                          ),
                        ],
                      ));
                },
              )
            : const Align(
                alignment: Alignment.center,
                child: Text("No data Found"),
              ),
      ),
    );
  }

  final List<String> list = [];


  void removeContact(String num) async{
    await FirebaseDatabase.instance.ref(num).remove();
    getUsers();
  }

  void getUsers() async {
    printLog("Under");
    list.clear();
    final snapshot = await FirebaseDatabase.instance.ref().get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    printLog("Under ${json.encode(map)}");
    map.forEach((key, value) {
      //final user = ClassName.fromJson(value);

      printLog("Printing 123 :: ${value["mobile"].toString()}");

      list.add(value["mobile"].toString());
    });

    printLog("Useer length :: ${list.length}");

    setState(() {});
  }
}
