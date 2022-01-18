import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Stores/my_store.dart';
import '../Stores/student.dart';

bool adding = false;

class EditStudent extends StatefulWidget {
  final Student student_;
  const EditStudent({
    Key? key,
    required this.student_,
  }) : super(key: key);

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  TextEditingController userID = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController joining_year = TextEditingController();
  List<String> branches = ["CSE", "CCE", "ECE", "ME", "CSE Dual", "ECE Dual"];

  _showPickerBranch() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                "Branch".text.bold.xl2.make().p12().centered(),
                ListView.builder(
                  itemCount: branches.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                        // leading: Icon(CupertinoIcons.person_alt_circle),
                        title: Text(branches[index]).centered(),
                        onTap: () async {
                          branch.text = branches[index];
                          setState(() {});
                          Navigator.pop(context);
                        });
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    adding = false;
    userID.text = widget.student_.userid!;
    name.text = widget.student_.name!;
    branch.text = widget.student_.branch!;
    joining_year.text = widget.student_.joining_year!;

    super.initState();
  }

  final MyStore store = VxState.store;
  final _formKey2 = GlobalKey<FormState>();

  Future<void> sendQuery() async {
    if (_formKey2.currentState!.validate()) {
      adding = true;
      print(adding);
      setState(() {});
      try {
        final Dio _dio = Dio();
        Response response = await _dio.post(
          'https://guarded-mesa-99449.herokuapp.com/student/update',
          data: {
            "userId": userID.text,
            "name": name.text,
            "joining_year": joining_year.text,
            "Branch": branch.text,
            "Student_DOB": "2021-10-11",
          },
        );

        print('Updating: ${response.data}');

        if (response.data.toString() == "success") {
          final Dio _dio = Dio();
          Response response_ = await _dio.get(
            'https://guarded-mesa-99449.herokuapp.com/student/list',
          );
          StudentCatalog.studentCatalog = List.from(response_.data)
              .map((itemMap) => Student.fromMap(itemMap))
              .toList();
          store.studentListStore = StudentCatalog.studentCatalog;
          if (StudentCatalog.studentCatalog!.isEmpty) {
            Fluttertoast.showToast(msg: "No Student available.");
          }
          Navigator.pop(context);

          setState(() {
            adding = false;
          });
          Fluttertoast.showToast(msg: "Student successfully updated");
        } else {
          setState(() {
            adding = false;
          });
          print(response.data);
          Fluttertoast.showToast(msg: "Not able to update.");
        }
      } catch (e) {
        setState(() {
          adding = false;
        });
        Fluttertoast.showToast(msg: 'Some error occured');
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    "Edit Student Details".text.xl5.bold.make().expand(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(CupertinoIcons.chevron_back),
                      iconSize: 40,
                    )
                  ],
                ).p20(),

                // "Edit account".text.xl2.make(),
                "Edit ${widget.student_.name}'s details"
                    .text
                    .xl2
                    .make()
                    .pOnly(left: 20),
                CupertinoFormSection(
                  backgroundColor: Colors.transparent,
                  header: "Personal Details".text.make(),
                  children: [
                    CupertinoFormRow(
                      //padding: EdgeInsets.only(left: 0),
                      child: CupertinoTextFormFieldRow(
                        controller: userID,
                        enabled: false,
                        placeholder: "Username",
                        // prefix: "Email".text.make(),
                        padding: const EdgeInsets.only(left: 0),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        prefix: "Student ID ".text.caption(context).make(),
                      ),
                    ),
                    CupertinoFormRow(
                      //padding: EdgeInsets.only(left: 0),
                      child: CupertinoTextFormFieldRow(
                        controller: name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name can't be empty";
                          }
                          return null;
                        },
                        placeholder: "Name",
                        // prefix: "Name".text.make(),
                        padding: const EdgeInsets.only(left: 0),
                        prefix: "Name ".text.caption(context).make(),
                      ),
                    ),
                    CupertinoFormRow(
                      //padding: EdgeInsets.only(left: 0),
                      child: CupertinoTextFormFieldRow(
                        controller: branch,
                        onTap: _showPickerBranch,
                        placeholder: "Branch",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Branch can't be empty";
                          }
                          return null;
                        },
                        prefix: "Branch ".text.caption(context).make(),
                        decoration: const BoxDecoration(color: Colors.white),
                        readOnly: true,
                        padding: const EdgeInsets.only(left: 0),
                      ),
                    ),
                    CupertinoFormRow(
                      //padding: EdgeInsets.only(left: 0),
                      child: CupertinoTextFormFieldRow(
                        controller: joining_year,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Joining year can't be empty";
                          }
                          return null;
                        },
                        prefix: "Batch ".text.caption(context).make(),
                        placeholder: "Joining Year",

                        // prefix: "Username".text.make(),
                        padding: const EdgeInsets.only(left: 0),
                      ),
                    ),
                  ],
                ).pOnly(left: 20, right: 20, top: 10),

                50.heightBox,
                Container(
                  width: 70,
                  height: 70,

                  // color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: adding
                      ? const CircularProgressIndicator(
                          color: Colors.grey,
                        )
                      : IconButton(
                          onPressed: () {
                            sendQuery();
                          },
                          icon: const Icon(CupertinoIcons.checkmark_seal_fill),
                          iconSize: 60,
                          color: Colors.grey,
                        ).centered(),
                ).centered(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
