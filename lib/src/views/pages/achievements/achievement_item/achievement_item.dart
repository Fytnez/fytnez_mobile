import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/dtos/achievement_dto.dart';
import 'package:fytnez_mobile/src/views/styles/colors.dart';

class AchievementItem extends StatelessWidget {
  final AchievementDTO achievement;

  const AchievementItem({super.key, required this.achievement});

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
                      color: Color(int.parse(achievement.getHexColor().replaceAll('#', ''), radix: 16) + 0xFF000000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(IconData(
                          int.parse(achievement.getIcon()),
                          fontFamily: 'MaterialIcons')),
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
                      achievement.getName(),
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
                      achievement.getDescription(),
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
