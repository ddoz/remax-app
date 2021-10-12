import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _key = new GlobalKey<FormState>();
  DateTime selectedPublishDate = DateTime.now();
  TextEditingController controllerPublishDate = new TextEditingController();
  Future<void> _selectPublishDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedPublishDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedPublishDate)
      setState(() {
        selectedPublishDate = picked;
        //controllerPublishDate.text = convertTanggal(selectedPublishDate);
        controllerPublishDate.text = selectedPublishDate.toString();
      });
  }

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  bool _switchValue = true;

  // Group Value for Radio Button.
  int id = 1;
  NotchedShape shape;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
        centerTitle: true,
        backgroundColor: kAppBarColorTheme,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: shape,
        color: Colors.red,
        child: IconTheme(
          data: IconThemeData(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                tooltip: 'Update',
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Delete',
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _selectPublishDate(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        enabled: false,
                        controller: controllerPublishDate,
                        onChanged: (value) {},
                        style: TextStyle(fontSize: 13.0),
                        decoration: InputDecoration(
                            hintText: "Date",
                            hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                                fontSize: 13.0),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Property Type:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "Property Type",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Owner:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "Owner Name",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = 'Male';
                          id = 1;
                        });
                      },
                    ),
                    Text(
                      'Male',
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = 'Female';
                          id = 2;
                        });
                      },
                    ),
                    Text(
                      'Female',
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hp Number:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "Hp Number",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("E-mail Address:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "E-mail Address",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Transaction Type:"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Sale';
                              id = 1;
                            });
                          },
                        ),
                        Text(
                          'Sale',
                          style: new TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Rent';
                              id = 2;
                            });
                          },
                        ),
                        Text(
                          'Rent',
                          style: new TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Buyer/Renter:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "Buyer/Renter",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hp Number:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "Hp Number",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("E-mail Address:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "E-mail Address",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Start Date:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _selectPublishDate(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        enabled: false,
                        controller: controllerPublishDate,
                        onChanged: (value) {},
                        style: TextStyle(fontSize: 13.0),
                        decoration: InputDecoration(
                            hintText: "Start Date",
                            hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                                fontSize: 13.0),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("End Date:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _selectPublishDate(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        enabled: false,
                        controller: controllerPublishDate,
                        onChanged: (value) {},
                        style: TextStyle(fontSize: 13.0),
                        decoration: InputDecoration(
                            hintText: "End Date",
                            hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                                fontSize: 13.0),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = 'Primary';
                          id = 1;
                        });
                      },
                    ),
                    Text(
                      'Primary',
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonItem = 'Secondary';
                          id = 2;
                        });
                      },
                    ),
                    Text(
                      'Secondary',
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(
                            enabled: false,
                            controller: controllerPublishDate,
                            onChanged: (value) {},
                            style: TextStyle(fontSize: 13.0),
                            decoration: InputDecoration(
                                hintText: "Price",
                                hintStyle: TextStyle(
                                    color: kPrimaryColor.withOpacity(0.5),
                                    fontSize: 13.0),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("/"),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                          child: TextField(
                            enabled: false,
                            controller: controllerPublishDate,
                            onChanged: (value) {},
                            style: TextStyle(fontSize: 13.0),
                            decoration: InputDecoration(
                                hintText: "Transaction",
                                hintStyle: TextStyle(
                                    color: kPrimaryColor.withOpacity(0.5),
                                    fontSize: 13.0),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Upload Foto:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(
                            enabled: false,
                            controller: controllerPublishDate,
                            onChanged: (value) {},
                            style: TextStyle(fontSize: 13.0),
                            decoration: InputDecoration(
                                hintText: "Upload Foto",
                                hintStyle: TextStyle(
                                    color: kPrimaryColor.withOpacity(0.5),
                                    fontSize: 13.0),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Upload"),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Notary Name:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "Notary Name",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hp Number:"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      enabled: false,
                      controller: controllerPublishDate,
                      onChanged: (value) {},
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                          hintText: "Hp Number",
                          hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                              fontSize: 13.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Activate:"),
                CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
