import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/widgets/contact_section.dart';

class MainDesktop extends StatelessWidget {

  const MainDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: screenSize.height / 1.2,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //intro
              const Text(
                "hi, \nI'm Vishal \n",
                style: TextStyle(
                  fontSize: 30.0,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomeColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                // key: navbarKeys.first,
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: const Text("Contact")),
              )
            ],
          ),
          Image.asset(
            "assets/Designer-removebg-preview.png",
            width: screenWidth / 2,
          ),
        ],
      ),
    );
  }
}
