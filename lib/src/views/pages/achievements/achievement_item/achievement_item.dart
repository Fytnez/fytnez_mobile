import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/views/styles/colors.dart';

class AchievementItem extends StatelessWidget {
  final String achievementName;
  final String achievementDescription;

  const AchievementItem(
      {super.key,
      required this.achievementName,
      required this.achievementDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337,
      height: 177,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: ShapeDecoration(
        color: COLOR_PRIMARY_300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.favorite),
                    )),
              )),
          Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      achievementName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      achievementDescription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ]),
              )),
        ],
      ),
    );
  }
}
