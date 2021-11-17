import 'package:flutter/material.dart';
import 'package:resume_maker/pdf_api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String str = '';
  double prow = 0.0;
  var name = TextEditingController();
  var college = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var address = TextEditingController();

  var codechef = TextEditingController();
  var codeforces = TextEditingController();
  var github = TextEditingController();
  var leetcode = TextEditingController();
  var linkedin = TextEditingController();

  List<String> inst = [];
  List<String> descrip = [];

  List<String> role = [];
  List<String> exporg = [];
  List<String> expdes = [];

  final technicalexp = TextEditingController();
  final technicaldev = TextEditingController();
  final techincalcourse = TextEditingController();

  //Projects variables
  List<String> projectname = [];
  List<String> projectliveLink = [];
  List<String> projectgithub = [];
  List<String> projectdescrip = [];

  String achievment = '';

  int _count = 0;
  int _exp = 0;

  double codebool = 0;

  Color bg1 = Colors.white;
  Color look1 = Colors.black;
  Color all1 = Colors.grey.shade100;

  Color bg2 = Colors.blueGrey.shade900;
  Color look2 = Colors.white54;
  Color all2 = Colors.black87;

  Color bg = Colors.white;
  Color look = Colors.black87;
  Color all = Colors.grey.shade100;

  int _project = 0;

  @override
  void initState() {
    super.initState();
    _count = 0;
    _exp = 0;

    bg = bg1;
    look = look1;
    all = all1;

    _project = 0;
    codebool = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: bg,
        shadowColor: bg,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(35, 3, 35, 3),
          child: Row(
            children: [
              Text(
                'Resume Maker    ',
                style: TextStyle(
                  color: look,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'lato',
                ),
              ),
              const Icon(Icons.picture_as_pdf,
                  size: 35, color: Colors.redAccent),
            ],
          ),
        ),
        backgroundColor: bg,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: all,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.2, color: bg),
                          borderRadius: BorderRadius.circular(7),
                          color: bg,
                          boxShadow: [
                            BoxShadow(
                              color: look == look1
                                  ? Colors.blueGrey.shade100
                                  : Colors.white30,
                              offset: const Offset(
                                2.0,
                                2.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Text(
                              '  Welcome to Resume Creator !!',
                              style: TextStyle(
                                  color: look,
                                  fontFamily: 'lato',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (all == all1) {
                                      all = all2;
                                      look = look2;
                                      bg = bg2;
                                    } else {
                                      all = all1;
                                      look = look1;
                                      bg = bg1;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.lightbulb,
                                  color: look,
                                  size: 22,
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.2, color: bg),
                          borderRadius: BorderRadius.circular(7),
                          color: bg,
                          boxShadow: [
                            BoxShadow(
                              color: look == look1
                                  ? Colors.blueGrey.shade100
                                  : Colors.white30,
                              offset: const Offset(
                                2.0,
                                2.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 2.0,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Enter all Data as instructed\nand then click on SUBMIT',
                          style: TextStyle(
                            color: look,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'lato',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _count = 0;
                          _exp = 0;

                          _project = 0;
                          str = '';
                          prow = 0.0;

                          codebool = 0;
                          showToast('Complete Information Reset!! Enter New Data freshly.');
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: bg,
                        onPrimary: Colors.redAccent,
                        onSurface: Colors.orangeAccent,
                      ),
                      child: Text('Reset All',
                          style: TextStyle(
                            color: look,
                            fontFamily: 'lato',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              personal(),
              const SizedBox(
                height: 25,
              ),
              education(),
              const SizedBox(
                height: 25,
              ),
              code(),
              const SizedBox(
                height: 3,
              ),
              codingprofile(),
              const SizedBox(
                height: 25,
              ),
              experience(),
              const SizedBox(
                height: 25,
              ),
              technical(),
              const SizedBox(
                height: 25,
              ),
              projects(),
              const SizedBox(
                height: 25,
              ),
              achieving(),
              const SizedBox(
                height: 25,
              ),
              submit(),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                    ' Created by Saptarshi Mandal ,\n         KGEC IT 2nd Year  .',
                    style: TextStyle(
                      color: look,
                      fontFamily: 'lato',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showToast(String s) {
    Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.lightGreenAccent,
      textColor: Colors.deepPurple.shade900,
    );
  }

  Widget projects() {
    final pro1 = TextEditingController();
    final pro2 = TextEditingController();
    final pro3 = TextEditingController();
    final pro4 = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: bg, width: 1.6),
              borderRadius: BorderRadius.circular(7),
              color: bg,
              boxShadow: [
                BoxShadow(
                  color:
                      look == look1 ? Colors.blueGrey.shade100 : Colors.white30,
                  offset: const Offset(
                    2.0,
                    2.0,
                  ),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Projects ShowCase  ',
                      style: TextStyle(
                        color: look,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'lato',
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _project++;
                            prow = 300;
                          });
                        },
                        child: const Text('Add Project',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'lato')),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreenAccent,
                        )),
                    const SizedBox(
                      width: 2.4,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _project = 0;
                            prow = 0;
                            showToast('All Project Info Deleted Successfully.');
                          });
                        },
                        child: const Text('DELETE',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'lato')),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent.shade400,
                        )),
                  ],
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: prow,
                  child: ListView.builder(
                      itemCount: _project,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(2, 2, 2, 6),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: bg, width: 1.6),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Row(children: [
                                    Text(
                                      "       Project ${index + 1}       ",
                                      style: TextStyle(
                                        color: look,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                        fontFamily: 'lato',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          projectname.add(pro1.text);
                                          projectliveLink.add(pro2.text);
                                          projectgithub.add(pro3.text);
                                          projectdescrip.add(pro4.text);
                                          showToast('Project ' +
                                              (index + 1).toString() +
                                              ' added successfully.');
                                        },
                                        child: const Text('Confirm ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              fontFamily: 'lato',
                                            )),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors
                                                .lightGreenAccent.shade400,
                                            onPrimary:
                                                Colors.greenAccent.shade400)),
                                    const SizedBox(
                                      width: 1.2,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _project--;
                                            if (_project == 0) {
                                              prow = 0;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.redAccent.shade700,
                                          size: 28,
                                        ))
                                  ]),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    controller: pro1,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Project Name ',
                                      hintStyle: TextStyle(
                                        color: look,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'lato',
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: look,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'lato',
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 1.4,
                                  ),
                                  TextField(
                                    controller: pro2,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Project Live Link ',
                                      hintStyle: TextStyle(
                                        color: look,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'lato',
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: look,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'lato',
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 1.4,
                                  ),
                                  TextField(
                                    controller: pro3,
                                    decoration: InputDecoration(
                                      hintText: 'Enter GitHub Link ',
                                      hintStyle: TextStyle(
                                        color: look,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'lato',
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: look,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'lato',
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 1.4,
                                  ),
                                  TextField(
                                    controller: pro4,
                                    decoration: InputDecoration(
                                      hintText: 'Description ',
                                      hintStyle: TextStyle(
                                        color: look,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'lato',
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: look,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'lato',
                                    ),
                                    maxLines: 6,
                                  ),
                                  const SizedBox(
                                    height: 1.4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          )),
    );
  }

  Widget achieving() {
    final a = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: bg,
            ),
            color: bg,
            boxShadow: [
              BoxShadow(
                color:
                    look == look1 ? Colors.blueGrey.shade100 : Colors.white30,
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 3.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Achievements  :  ',
                      style: TextStyle(
                        color: look,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'lato',
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          achievment = a.text;
                        });
                      },
                      child: const Text('Add Changes ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'lato',
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreenAccent.shade200,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: a,
                decoration: InputDecoration(
                  hintText: 'Description (Write in Paragraph) ',
                  hintStyle: TextStyle(
                    color: look,
                    fontSize: 15,
                    fontFamily: 'lato',
                  ),
                ),
                style: TextStyle(
                  color: look,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'lato',
                ),
                maxLines: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget codingprofile() {
    return SizedBox(
      height: codebool,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: bg, width: 1.4),
              borderRadius: BorderRadius.circular(8),
              color: bg,
              boxShadow: [
                BoxShadow(
                  color:
                      look == look1 ? Colors.blueGrey.shade100 : Colors.white30,
                  offset: const Offset(
                    2.0,
                    2.0,
                  ),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Coding Profile Links : ',
                  style: TextStyle(
                    color: look,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'lato',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: codechef,
                  decoration: InputDecoration(
                    hintText: 'Enter CodeChef Username',
                    hintStyle: TextStyle(
                      color: look,
                      fontSize: 15,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextStyle(
                    color: look,
                    fontSize: 15,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ), //Codechef

                const SizedBox(
                  height: 6,
                ),

                TextField(
                  controller: codeforces,
                  decoration: InputDecoration(
                    hintText: 'Enter CodeForces Username',
                    hintStyle: TextStyle(
                      color: look,
                      fontSize: 15,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextStyle(
                    color: look,
                    fontSize: 15,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ), //Codeforces

                const SizedBox(
                  height: 6,
                ),

                TextField(
                  controller: github,
                  decoration: InputDecoration(
                    hintText: 'Enter GitHub Profile Username',
                    hintStyle: TextStyle(
                      color: look,
                      fontSize: 15,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextStyle(
                    color: look,
                    fontSize: 15,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 6,
                ),
                TextField(
                  controller: linkedin,
                  decoration: InputDecoration(
                    hintText: 'Enter Linked In Profile Url ',
                    hintStyle: TextStyle(
                      color: look,
                      fontSize: 15,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextStyle(
                    color: look,
                    fontSize: 15,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ), //Codechef//GitHub

                const SizedBox(
                  height: 6,
                ),

                TextField(
                  controller: leetcode,
                  decoration: InputDecoration(
                    hintText: 'Enter LeetCode Username',
                    hintStyle: TextStyle(
                      color: look,
                      fontSize: 15,
                      fontFamily: 'lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextStyle(
                    color: look,
                    fontSize: 15,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                ), //Leetcode
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget personal() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1.2, color: bg),
            borderRadius: BorderRadius.circular(7),
            color: bg,
            boxShadow: [
              BoxShadow(
                color:
                    look == look1 ? Colors.blueGrey.shade100 : Colors.white30,
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 3.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Text(
                'Personal Information',
                style: TextStyle(
                    color: look,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'lato'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: look,
                      fontFamily: 'lato',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextStyle(
                    color: look,
                    fontFamily: 'lato',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: look,
                      fontFamily: 'lato',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  maxLines: 1,
                  style: TextStyle(
                    color: look,
                    fontFamily: 'lato',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    hintStyle: TextStyle(
                      color: look,
                      fontFamily: 'lato',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  maxLines: 1,
                  style: TextStyle(
                    color: look,
                    fontFamily: 'lato',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: address,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: TextStyle(
                      color: look,
                      fontFamily: 'lato',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  maxLines: 1,
                  style: TextStyle(
                    color: look,
                    fontFamily: 'lato',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //Personal

  Widget education() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.4, color: bg),
                  borderRadius: BorderRadius.circular(7),
                  color: bg,
                  boxShadow: [
                    BoxShadow(
                      color: look == look1
                          ? Colors.blueGrey.shade100
                          : Colors.white30,
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 3.0,
                      spreadRadius: 2.0,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Education  ',
                      style: TextStyle(
                        color: look,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'lato',
                      ),
                    ),
                    Icon(
                      Icons.cast_for_education_rounded,
                      color: look,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    IconButton(
                      onPressed: () async {
                        setState(() {
                          _count++;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.orangeAccent.shade400,
                        size: 35,
                      ),
                    )
                  ],
                ),
              )),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: _count,
            itemBuilder: (context, index) {
              return edu(index);
            })
      ],
    );
  }

  Widget edu(int index) {
    final val = TextEditingController();
    final val1 = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1.2, color: bg),
            borderRadius: BorderRadius.circular(7),
            color: bg,
            boxShadow: [
              BoxShadow(
                color:
                    look == look1 ? Colors.blueGrey.shade100 : Colors.white30,
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 3.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Text('Enter Institute Data       ',
                        style: TextStyle(
                          color: look,
                          fontFamily: 'lato',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      width: 1,
                    ),
                    ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'Add ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'lato',
                            fontSize: 12,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreenAccent.shade400,
                      ),
                      onPressed: () {
                        inst.add(val.text);
                        descrip.add(val1.text);

                        showToast('Institute ' +
                            (index + 1).toString() +
                            ' Info added successfully.');
                      },
                    ),
                    const SizedBox(
                      width: 0.6,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _count--;
                          });
                        },
                        icon: Icon(
                          Icons.delete_rounded,
                          color: Colors.deepOrange.shade900,
                          size: 28,
                        ))
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: val,
                        decoration: InputDecoration(
                            hintText: 'Institution ',
                            hintStyle: TextStyle(
                              color: look,
                              fontFamily: 'lato',
                              fontSize: 16,
                            )),
                        maxLines: 1,
                        style: TextStyle(
                          color: look,
                          fontFamily: 'lato',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                          controller: val1,
                          decoration: InputDecoration(
                              hintText: 'Description ',
                              hintStyle: TextStyle(
                                color: look,
                                fontFamily: 'lato',
                                fontSize: 16,
                              )),
                          maxLines: 3,
                          style: TextStyle(
                            color: look,
                            fontFamily: 'lato',
                            fontSize: 16,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
    // return Row(children: [
    //   Text(index.toString()),
    // ],);
  }

  Widget code() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: bg,
              border: Border.all(color: bg, width: 1.4),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color:
                      look == look1 ? Colors.blueGrey.shade100 : Colors.white30,
                  offset: const Offset(
                    2.0,
                    2.0,
                  ),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Text('Do you have Coding Profile Links ?   ',
                    style: TextStyle(
                      color: look,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: 'lato',
                    )),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      codebool = 390;
                    });
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                      fontFamily: 'lato',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent.shade400,
                  ),
                ),
                const SizedBox(width: 1),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      codebool = 0;
                    });
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                      fontFamily: 'lato',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent.shade400,
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget experience() {
    final a = TextEditingController();
    final b = TextEditingController();
    final c = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: bg),
                borderRadius: BorderRadius.circular(8),
                color: bg,
                boxShadow: [
                  BoxShadow(
                    color: look == look1
                        ? Colors.blueGrey.shade100
                        : Colors.white30,
                    offset: const Offset(
                      2.0,
                      2.0,
                    ),
                    blurRadius: 3.0,
                    spreadRadius: 2.0,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    'Experience  ',
                    style: TextStyle(
                      color: look,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'lato',
                    ),
                  ),
                  Icon(
                    Icons.work,
                    size: 25,
                    color: look,
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _exp++;
                        });
                      },
                      icon: Icon(
                        Icons.add_circle_rounded,
                        color: Colors.lightGreenAccent.shade200,
                        size: 28,
                      ))
                ],
              ),
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: _exp,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(9.5),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.4,
                          color: look == look1
                              ? Colors.white70
                              : Colors.blueGrey.shade800),
                      borderRadius: BorderRadius.circular(8),
                      color:
                          look == look1 ? Colors.white70 : Colors.grey.shade700,
                      boxShadow: [
                        BoxShadow(
                          color: look == look1
                              ? Colors.blueGrey.shade100
                              : Colors.white30,
                          offset: const Offset(
                            2.0,
                            2.0,
                          ),
                          blurRadius: 3.0,
                          spreadRadius: 2.0,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Enter Experience Details:  ",
                              style: TextStyle(
                                color: look,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'lato',
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    role.add(a.text);
                                    exporg.add(b.text);
                                    expdes.add(c.text);

                                    showToast('Experience Info added successfully.');
                                  });
                                },
                                icon: Icon(
                                  Icons.add_circle_outlined,
                                  color: Colors.lightGreenAccent.shade400,
                                  size: 28,
                                )),
                            const SizedBox(
                              width: 1,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _exp--;
                                  });
                                },
                                icon: Icon(
                                  Icons.delete_forever_rounded,
                                  color: Colors.redAccent.shade400,
                                  size: 28,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Role',
                                  labelStyle: TextStyle(
                                    color: look,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'lato',
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                style: TextStyle(
                                  color: look,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'lato',
                                ),
                                controller: a,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Organization',
                                  labelStyle: TextStyle(
                                    color: look,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'lato',
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                style: TextStyle(
                                  color: look,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'lato',
                                ),
                                controller: b,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  labelStyle: TextStyle(
                                    color: look,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'lato',
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                style: TextStyle(
                                  color: look,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'lato',
                                ),
                                controller: c,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
      ],
    );
  }

  Widget technical() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1.4, color: bg),
            borderRadius: BorderRadius.circular(7),
            color: bg,
            boxShadow: [
              BoxShadow(
                color:
                    look == look1 ? Colors.blueGrey.shade100 : Colors.white30,
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 3.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Technical Skills      ',
                    style: TextStyle(
                      fontSize: 28,
                      color: look,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'lato',
                    ),
                  ),
                  Icon(
                    Icons.device_hub_rounded,
                    color: Colors.deepOrangeAccent.shade400,
                    size: 28,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text('Enter in Paragraph: ',
                      style: TextStyle(
                          color: look, fontSize: 15, fontFamily: 'lato')),
                  const SizedBox(
                    width: 32,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.lightGreenAccent.shade400,
                        primary: Colors.lightGreenAccent.shade700,
                      ),
                      child: const Text(
                        ' Add',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    width: 1.8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.deepPurple.shade900,
                        primary: Colors.deepPurple.shade900,
                      ),
                      child: const Text(
                        ' Reset Data',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: look, fontSize: 16, fontFamily: 'lato'),
                decoration: InputDecoration(
                    labelText: 'Experienced',
                    labelStyle: TextStyle(
                      color: look,
                      fontSize: 16,
                      fontFamily: 'lato',
                    )),
                controller: technicalexp,
                maxLines: 2,
              ),
              const SizedBox(
                height: 4,
              ),
              TextField(
                style: TextStyle(color: look, fontSize: 16, fontFamily: 'lato'),
                decoration: InputDecoration(
                    labelText: 'Development',
                    labelStyle: TextStyle(
                        color: look, fontSize: 16, fontFamily: 'lato')),
                controller: technicaldev,
                maxLines: 2,
              ),
              const SizedBox(
                height: 4,
              ),
              TextField(
                style: TextStyle(color: look, fontSize: 16, fontFamily: 'lato'),
                decoration: InputDecoration(
                    labelText: 'CourseWork',
                    labelStyle: TextStyle(
                        color: look, fontSize: 16, fontFamily: 'lato')),
                controller: techincalcourse,
                maxLines: 2,
              ),
              const SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget submit() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.lightGreenAccent.shade700,
        onPrimary: Colors.greenAccent.shade400,
      ),
      onPressed: () async {
        final pdfFile = await PdfApi.generateCenteredText(
            name.text,
            college.text,
            email.text,
            phone.text,
            address.text,
            inst,
            descrip,
            technicalexp.text,
            technicaldev.text,
            techincalcourse.text,
            codechef.text,
            codeforces.text,
            github.text,
            linkedin.text,
            leetcode.text,
            projectname,
            projectliveLink,
            projectgithub,
            projectdescrip,
            achievment,
            _exp,
            role,
            exporg,
            expdes);

        PdfApi.openFile(pdfFile);
      },
      child: const Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'lato',
        ),
      ),
    );
  }
}
