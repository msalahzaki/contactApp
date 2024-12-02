import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Nocontact extends StatelessWidget {
  const Nocontact({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

             SizedBox(
                width: 250,
                height: 250,
                child: Lottie.asset(
                  'assets/animation/loadContacts.json',
                )
             ),
          Text(
            "There is No Contacts Added Here",
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
