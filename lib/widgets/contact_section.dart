import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_link.dart';
import 'package:my_portfolio/widgets/custome_text_field.dart';

import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
                //else
                return buildnameEmailFieldMobile();
              },
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          //massage

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomeTextField(
              hintText: "Your Message",
              maxLines: 16,
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //send button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Contact"),
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
          //SNS icon button link
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open',[SnsLink.github]);
                },
                child: Image.asset(
                  "github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {js.context.callMethod('open',[SnsLink.linkedIn]);},
                child: Image.asset(
                  "github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {js.context.callMethod('open',[SnsLink.instagram]);},
                child: Image.asset(
                  "github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {js.context.callMethod('open',[SnsLink.facebook]);},
                child: Image.asset(
                  "github.png",
                  width: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildnameEmailFieldDesktop() {
    return Row(
      children: [
        //name

        Flexible(
          child: CustomeTextField(
            hintText: "Your name",
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        const SizedBox(height: 15,),

        //email

        Flexible(
          child: CustomeTextField(
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Column buildnameEmailFieldMobile() {
    return Column(
      children: [
        //name

        Flexible(
          child: CustomeTextField(
            hintText: "Your name",
          ),
        ),
        const SizedBox(
          height: 15,
        ),

        //email

        Flexible(
          child: CustomeTextField(
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }
}
