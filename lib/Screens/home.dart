import 'package:contact_app/Screens/addUser.dart';
import 'package:contact_app/Screens/noContact.dart';
import 'package:contact_app/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'contactInfo.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <Contact> contacts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initContacts();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.contain,
          alignment: Alignment.topLeft,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Adduser(addContact),
           // isDismissible: false,
          );
        },
        child: const Icon(Icons.add),
      ),
      body:contacts.length == 0 ? Nocontact():ContactInfo(contacts: contacts,deleteContact:deleteContact,)

    );
  }
  initContacts(){
    contacts= [
      Contact(name: 'Leo Messi', email: "Email@Domain.com", phone: "+2012569852", image: "assets/images/1.jpg"),
      Contact(name: 'Leo Messi', email: "Email@Domain.com", phone: "+2012569852", image: "assets/images/2.png"),
      Contact(name: 'Leo Messi', email: "Email@Domain.com", phone: "+2012569852", image: "assets/images/3.jpg"),
      Contact(name: 'Leo Messi', email: "Email@Domain.com", phone: "+2012569852", image: "assets/images/Messi.jpg"),
      Contact(name: 'Leo Messi', email: "Email@Domain.com", phone: "+2012569852", image: "assets/images/1.jpg"),
     ];
  }
  void addContact(String name,String email, String phone ,String image,bool isFile ){
    contacts.add(Contact(name: name, email: email, phone: phone, image: image,isFile: isFile));
    setState(() {

    });
  }
  void deleteContact(int index){
   index == -1 ? contacts.removeLast():contacts.removeAt(index);
    setState(() {
    });
  }
}
