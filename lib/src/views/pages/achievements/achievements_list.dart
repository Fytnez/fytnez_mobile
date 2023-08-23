import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/apis/fytnez/achievement_route.dart';
import 'package:fytnez_mobile/src/dtos/achievement_dto.dart';
import 'package:fytnez_mobile/src/views/pages/achievements/achievement_item/achievement_item.dart';
import 'package:fytnez_mobile/src/views/styles/colors.dart';

class AchievementsList extends StatefulWidget {
  static const String _routeName = '/';

  static String getRouteName() => _routeName;

  const AchievementsList({super.key});

  @override
  State<AchievementsList> createState() => _AchievementsListState();
}

class _AchievementsListState extends State<AchievementsList> {
  final AchievementRoute _achievementRoute = AchievementRoute();
  List<AchievementDTO> _achievements = [];

  @override
  void initState() {
    super.initState();
    _achievementRoute.listAll().then((achievements) => setState(() {
          _achievements = achievements;
        }));
  }

  @override
  Widget build(BuildContext context) {
    print(_achievements);
    return Scaffold(
      backgroundColor: COLOR_PRIMARY_100,
      appBar: AppBar(
        title: const Text('Conquistas'),
        backgroundColor: COLOR_PRIMARY_200,
        centerTitle: true,
      ),
      body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: _achievements
              .map((achievementDTO) =>
                  AchievementItem(achievement: achievementDTO))
              .toList()),
    );
  }
}
