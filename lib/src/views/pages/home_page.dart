import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/views/pages/profile/profile_page.dart';
import '../components/hydric_consumption.dart';

class Home extends StatefulWidget {
  static const String _routeName = '/home';

  static String getRouteName() => _routeName;

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    if (index == 4) {
      Navigator.pushNamed(context, ProfilePage.getRouteName());
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 41, 48, 0.95),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: HydricConsumption(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF2C343C),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.query_stats_sharp),
              label: 'Estatísticas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Dieta',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bolt_outlined),
              label: 'Treino',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
