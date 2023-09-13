import 'package:flutter/material.dart';
import 'package:fytnez_mobile/src/views/styles/colors.dart';
import '../components/content_holder.component.dart';
import 'profile/profile_page.dart';

class Home extends StatefulWidget {
  static const String _routeName = '/';

  static String getRouteName() => _routeName;

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    if (index == 4) {
      Navigator.pushNamed(context, '/user/form');
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromRGBO(32, 41, 48, 0.95),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ComponentHolder(
            height: 180.0,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    'Componente 1',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ornare ipsum vitae tempus pretium. Nulla accumsan lorem nec dolor imperdiet, et cursus lacus iaculis. Vestibulum nec ultricies est, quis tincidunt ipsum. Fusce vitae elementum massa, a auctor sem. Donec volutpat vulputate nisi sed ultricies.',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ComponentHolder(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        Text(
                          'Co 2',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      'Pellentesque nec quam sit amet eros faucibus egestas.',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: ComponentHolder(
                  children: [
                    Text(
                      'Componente 3',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Text(
                      'Proin est odio, accumsan quis sapien quis.',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: ComponentHolder(
                  children: [
                    Text(
                      'Componente 4',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Text(
                      'Nam id tincidunt enim, pellentesque facilisis ipsum.',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ComponentHolder(
            height: 180.0,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.house,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      Text(
                        'Componente 5',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.76),
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        'Duis commodo enim vitae justo tristique, eget porttitor dui laoreet. Nunc dui dolor.',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Botão Exemplo'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF2C343C),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            switch (index) {
              case 0: // Estatísticas
                break;
              case 1: // Dieta
                break;
              case 2:
                Navigator.pushReplacementNamed(context, Home.getRouteName());
                break;
              case 3: // Treino
                break;
              case 4: // Perfil
                Navigator.pushNamed(context, ProfilePage.getRouteName());
                break;
            }
          },
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
      ),
    ));
  }
}
