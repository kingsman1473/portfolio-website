import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:my_portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    

    return Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              child: Column(
                children: [
                  //work projects title
                  const Text(
                    "work projects",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomeColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(height: 50),

                  //work projects cards
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 900),
                    child: Wrap(
                      spacing: 25,
                      runSpacing: 25,
                      children: [
                        for (int i = 0; i < workProjectUtils.length; i++)
                          ProjectCardWidget(
                            project: workProjectUtils[i],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  //hobby projects title
                  const Text(
                    "hobby projects",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomeColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(height: 50),

                  //hobby projects cards
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 900),
                    child: Wrap(
                      spacing: 25,
                      runSpacing: 25,
                      children: [
                        for (int i = 0; i < hobbyProjectUtils.length; i++)
                          ProjectCardWidget(
                            project: hobbyProjectUtils[i],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
  }
}