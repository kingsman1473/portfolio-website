import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_link.dart';
import 'package:my_portfolio/widgets/custome_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final messageC = TextEditingController();
  
  get http => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: const Color.fromARGB(255, 2, 22, 56),
      child: Column(
        children: [
          Text(
            "Contact",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomeColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child: LayoutBuilder(
              builder: (context, Constraints) {
                if (Constraints.maxWidth >= kMinDesktopWidth) {
                  return buildnameEmailFieldDesktop();
                }
                // else
                return buildnameEmailFieldMobile();
              },
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          // message
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomeTextField(
              controller: messageC,
              hintText: "Your Message",
              maxLines: 16,
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // send button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () async {
                  // Reference to the Firestore collection
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('contacts');

                  // Adding the contact details to the Firestore collection
                  await collRef.add({
                    'name': nameC.text,
                    'email': emailC.text,
                    'message': messageC.text,
                    'timestamp': Timestamp.now(),
                  }).then((_) {
                    // Clear the text fields after submission
                    nameC.clear();
                    emailC.clear();
                    messageC.clear();

                    // Show a snackbar for success feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Message sent successfully!')),
                    );
                  }).catchError((error) {
                    // Show a snackbar for error feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to send message: $error')),
                    );
                  });
                },
                child: Text("Send"),
              ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(
            height: 30,
          ),
          // SNS icon button link
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLink.github]);
                },
                child: Image.asset(
                  "github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLink.linkedIn]);
                },
                child: Image.asset(
                  "linkedin.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLink.instagram]);
                },
                child: Image.asset(
                  "instagram.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLink.facebook]);
                },
                child: Image.asset(
                  "facebook.png",
                  width: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  // void sendEmailNotification(String name, String email, String message) async {
  //   // Replace with your SendGrid API key
  //   const apiKey = 'YOUR_SENDGRID_API_KEY';

  //   // Replace with the email address where you want to receive notifications
  //   const toEmail = 'abctesting43@gmail.com';

  //   // Replace with your email address
  //   const fromEmail = 'kingsman9893@gmail.com';

  //   final subject = 'New Contact Form Submission';
  //   final text = 'Name: $name\nEmail: $email\nMessage: $message';

  //   final url = 'https://api.sendgrid.com/v3/mail/send';
  //   final headers = {
  //     'Authorization': 'Bearer $apiKey',
  //     'Content-Type': 'application/json',
  //   };
  //   final body = {
  //     'personalizations': [
  //       {
  //         'to': [
  //           {'email': toEmail}
  //         ],
  //         'subject': subject,
  //       }
  //     ],
  //     'from': {'email': fromEmail},
  //     'content': [
  //       {'type': 'text/plain', 'value': text},
  //     ],
  //   };

  //   try {
  //     final response = await http.post(Uri.parse(url),
  //         headers: headers, body: jsonEncode(body));
  //     if (response.statusCode == 202) {
  //       print('Email sent successfully');
  //     } else {
  //       print('Failed to send email. Error: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('Failed to send email. Error: $e');
  //   }
  // }


  Row buildnameEmailFieldDesktop() {
    return Row(
      children: [
        // name
        Flexible(
          child: CustomeTextField(
            controller: nameC,
            hintText: "Your name",
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        const SizedBox(
          height: 15,
        ),

        // email
        Flexible(
          child: CustomeTextField(
            controller: emailC,
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Column buildnameEmailFieldMobile() {
    return Column(
      children: [
        // name
        Flexible(
          child: CustomeTextField(
            controller: nameC,
            hintText: "Your name",
          ),
        ),
        const SizedBox(
          height: 15,
        ),

        // email
        Flexible(
          child: CustomeTextField(
            controller: emailC,
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }


}
