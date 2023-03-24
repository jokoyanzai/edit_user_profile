import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String? gender;
    String profilePicture = "images/avatar.png";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Edit Profile",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              )),
          title: Text(
            "Edit Profile",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.done,
                  size: 24,
                ))
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 31),
                  child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(profilePicture)),
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.blue)),
                          width: 130,
                          height: 130,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white, 
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade300, width: 1)),
                            margin: EdgeInsets.fromLTRB(0, 0, 5, 5),
                            padding: EdgeInsets.all(3),
                            // width: 28,
                            // height: 28,
                            child: Icon(
                              Icons.add_a_photo,
                              size: 20,
                              color: Colors.grey[700],
                            ))
                      ]),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 14),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("Informasi Pribadi",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey.shade400
                    ),
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.5, 9, 15.5, 9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          LabelContainer(label: "Nama Lengkap"),
                          TextFieldContainer(inputType: TextInputType.name),
                          LabelContainer(label: "Email"),
                          TextFieldContainer(
                              inputType: TextInputType.emailAddress),
                          LabelContainer(label: "Username"),
                          TextFieldContainer(inputType: TextInputType.name),
                          LabelContainer(label: "No. Handphone"),
                          TextFieldContainer(inputType: TextInputType.phone),
                          LabelContainer(label: "Gender"),
                          Row(
                            children: <Widget>[
                              GenderRadioButton(title: "Male", value: "male", gender: gender),
                              GenderRadioButton(title: "Female", value: "female", gender: gender)
                            ],
                          ),
                        ],
                      ),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 35),
                  width: double.infinity,
                  height: 41,
                  child: OutlinedButton(
                    onPressed: (){}, 
                    style: ButtonStyle(
                      // fixedSize: MaterialStateProperty.all(Size(double.infinity, 41.0)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(color: Colors.blue, width: 1)
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.blue)
                    ),
                    child: Text(
                    "Batalkan Perubahan",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ))
                  ),
                )          
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderRadioButton extends StatelessWidget {
  const GenderRadioButton({
    required this.title,
    required this.value,
    super.key,
    required this.gender,
  });

  final String? gender;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: RadioListTile(
        value: value,
        groupValue: gender,
        onChanged: (String? value) {},
        title: Text(
          title,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        dense: true,
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    required this.inputType,
    super.key,
  });

  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: TextField(
        keyboardType: inputType,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        decoration: InputDecoration(
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
    );
  }
}

class LabelContainer extends StatelessWidget {
  const LabelContainer({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 7),
        child: Text(label,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)));
  }
}
