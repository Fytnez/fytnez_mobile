import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_PRIMARY_100,
      appBar: AppBar(
        title: const Text('Conquistas'),
        backgroundColor: COLOR_PRIMARY_200,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          AchievementItem(
            achievementName: 'Close',
            achievementDescription:
                'light sand went nodded burst tent might president leave its negative coast difficult noted industry determine jar lower bush smallest yellow dinner once having',
          ),
          AchievementItem(
            achievementName: 'Total',
            achievementDescription:
                'atom hello wherever danger member river they agree forgot fed trade aboard paragraph cream built music store hot generally depend product largest carry gasoline',
          ),
          AchievementItem(
            achievementName: 'Establish',
            achievementDescription:
                'peace mostly kill selection number cut current cheese probably score me planned far arrange if character done circus softly standard simply pair importance to',
          ),
          AchievementItem(
            achievementName: 'Substance',
            achievementDescription:
                'tea solid swam corner price yellow high select around been blanket home cave fifty brief too modern rays distance parts wing tonight tie stop',
          ),
          AchievementItem(
            achievementName: 'Realize',
            achievementDescription:
                'vowel political history gate country quick throughout is elephant hair include to factor danger movie customs dropped declared whatever wherever husband parent system last',
          ),
          AchievementItem(
            achievementName: 'Heat',
            achievementDescription:
                'happened neighbor behavior citizen sense higher dinner supper coming party interest taste ship good hold wrote are will continued apart start character up fifth',
          ),
          AchievementItem(
            achievementName: 'Atomic',
            achievementDescription:
                'sets particularly sink pig thrown history support snake signal operation should lead different softly combine practice teach shallow actually ever written within nothing design',
          ),
          AchievementItem(
            achievementName: 'Your',
            achievementDescription:
                'has however wood furniture dark youth average pig sky now related explanation shout examine breath shore history fall pond increase doctor somehow sign beginning',
          ),
          AchievementItem(
            achievementName: 'Pick',
            achievementDescription:
                'receive cream pie me nails brush chapter everybody ten certain remove leader outline alphabet each they tears massage discussion fort another church new adjective',
          ),
          AchievementItem(
            achievementName: 'Fill',
            achievementDescription:
                'population bar respect guard however mental kill save girl crack circle fighting western facing slipped layers money still failed seldom improve dollar being hello',
          ),
          AchievementItem(
            achievementName: 'Least',
            achievementDescription:
                'equator draw buried tone pocket surprise since fierce equal prevent silk tell carbon desert properly rest twenty help using main onto wait pack everyone',
          ),
          AchievementItem(
            achievementName: 'Teach',
            achievementDescription:
                'ear route usual split crop second lot triangle soldier writing hospital every small bone another pure whom higher sure equipment town sides shut in',
          ),
        ],
      ),
    );
  }
}
