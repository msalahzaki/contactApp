import 'dart:io';

import 'package:contact_app/Screens/home.dart';
import 'package:contact_app/core/util/color_palette.dart';
import 'package:flutter/material.dart';

import '../model/contact.dart';

class ContactInfo extends StatelessWidget {
 final Function (int)deleteContact;
   ContactInfo( {super.key, required this.contacts, required this.deleteContact});
   final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return Stack( alignment: Alignment.bottomRight,
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          childAspectRatio: 0.7,
          ),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return _buildGridItem(context, index);
          },
        ),
        Positioned(
          bottom: 80,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              deleteContact(-1);

            },
            backgroundColor: Colors.red,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    return Card(
      color: ColorPalette.gold,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    //
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: SizedBox(height: 150,
                      child: ! contacts[index].isFile ?
                      Image.asset(
                        contacts[index].image,
                        fit: BoxFit.fill,
                        width: double.infinity,
                       height: double.infinity,
                      ): Image.file(File(contacts[index].image),
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    ),
                    ),
                  ),
                  Container(

                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: ColorPalette.gold,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      contacts[index].name,
                      style:
                          TextStyle(color: ColorPalette.darkBlue, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child:  Row(
                  children: [const Icon(Icons.email), Text(contacts[index].email)],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child:  Row(
                  children: [const Icon(Icons.phone), Text(contacts[index].phone)],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () {
                   deleteContact(index);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, foregroundColor: Colors.white),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete),
                      Text("   Delete"),
                    ],
                  ),
                ),
              )
            ],
          )
          ],
        ),
      ),
    );
  }
}
