import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/project_utils.dart';

import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomeColor.bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //project img
          Image.asset(
            project.image,
            height: 140,
            width: 260,
            fit: BoxFit.cover,
          ),

          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomeColor.whitePrimary,
              ),
            ),
          ),

          //subtitle

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: TextStyle(
                fontSize: 12,
                color: CustomeColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          //footer
          Container(
            color: CustomeColor.bgLight1,
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "Available on :",
                  style: TextStyle(
                    color: CustomeColor.yellowSecondary,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                if (project.Link1 != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.Link1]);
                    },
                    child: Image.asset(
                      "",
                      width: 19,
                    ),
                  ),
                if (project.Link2 != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                        onTap: () {
                          js.context.callMethod("open", [project.Link2]);
                        },
                        child: Image.asset(
                          "",
                          width: 19,
                        )),
                  ),
                if (project.Link3 != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.Link3]);
                      },
                      child: Image.asset(
                        "assets/download__3_-removebg-preview.png",
                        width: 19,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
