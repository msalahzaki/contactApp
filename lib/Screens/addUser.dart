import 'dart:io';

import 'package:contact_app/core/util/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Adduser extends StatefulWidget {
  Function (String,String,String,String,bool)addContact;
  Adduser( this.addContact);

  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  String name = "User Name";
  String phone = "+20000000000";
  String? imageURL;
  String email = "Example@Email.com";
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.darkBlue,
      padding: const EdgeInsets.all(15),
      child: Form(
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: ColorPalette.gold,
                        padding: const EdgeInsets.all(15),
                      ),
                      child: imageURL == null
                          ? const Icon(Icons.image, size: 50)
                          : Image.file(File(imageURL!)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Divider(),
                        Text(
                          email,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Divider(),
                        Text(
                          phone,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  )
                  // ,  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (name) =>
                      name!.length < 3 ? 'Enter Valid Name' : null,
                  onChanged: (value) {

                      setState(() {
                        name = value;
                      });

                  },
                  decoration:
                      const InputDecoration(hintText: "Enter User Name"),
                )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text)=>emailvaldiate(text!) ? null : "enter valid email",
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter User Email"))),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          setState(() {
                            phone = value;
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter User Phone"))),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          widget.addContact(name,email,phone,imageURL!,true);
                          Navigator.pop(context);
                         // formkey.currentState!.validate();

                        },
                        child: const Text("Enter User"))),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        imageURL = File(image.path).path;
        print(imageURL);
      }
    });
  }

  bool emailvaldiate(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

  }
}
