import 'package:flutter/material.dart';
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/utilities/companyCardClass.dart';
import 'package:to_doc_patient/utilities/callCard.dart';
import 'package:to_doc_patient/services/secureStorage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String user;
  String password;
  List<Company> _company = comapanyList;

  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Map userdetails = await SecureStorage().readUserDetails();
    setState(() {
      user = userdetails['phoneOrEmail'];
      password = userdetails['password'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Palette.kPrimaryColor),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Palette.kWhite,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Cally",
                      style: kBigHeadingTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome to Cally \nCall hospitality in your hands",
                      style: kNormalHeadingTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Palette.kWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kCircularRadius),
                        topRight: Radius.circular(kCircularRadius))),
                child: Container(
                  color: Colors.transparent,
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _company.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CallCard(
                            image: _company[index].imgURL,
                            phNo: _company[index].phNo,
                            title: _company[index].name),
                      );
                    },
                  ),
                ),
              ))
            ])));
  }
}
