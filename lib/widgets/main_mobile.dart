import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return   Container(
              margin: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 30,
              ),
              height: screenHeight,
              constraints: const BoxConstraints(
                minHeight: 560,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //avtar img
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(colors: [
                        CustomeColor.scaffoldBg,
                        CustomeColor.scaffoldBg.withOpacity(0.6),
                      ]).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                    child: Image.asset(
                      "assets/Designer-removebg-preview.png",
                      width: screenWidth,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  // intro
                  const Text(
                    "hi, \nI'm Vishal \n",
                    style: TextStyle(
                      fontSize: 24.0,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: CustomeColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 180,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Contact")),
                  )
                ],
              ),
            );
  }
}