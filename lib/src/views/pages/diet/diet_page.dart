import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  static const String _routeName = 'diet';

  static String getRouteName() => _routeName;

  DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dieta'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16.0), // Espaço superior
              DietCard(
                title: 'Refeição 1',
                description: 'Descrição da Refeição 1',
              ),
              SizedBox(height: 16.0), // Espaço entre os cards
              DietCard(
                title: 'Refeição 2',
                description: 'Descrição da Refeição 2',
              ),
              SizedBox(height: 16.0), // Espaço entre os cards
              DietCard(
                title: 'Refeição 3',
                description: 'Descrição da Refeição 3',
              ),
              SizedBox(height: 16.0), // Espaço entre os cards
              DietCard(
                title: 'Refeição 4',
                description: 'Descrição da Refeição 4',
              ),
              SizedBox(height: 16.0), // Espaço entre os cards
              DietCard(
                title: 'Refeição 5',
                description: 'Descrição da Refeição 5',
              ),
              SizedBox(height: 16.0), // Espaço entre os cards
            ],
          ),
        ),
      ),
    );
  }
}

class DietCard extends StatelessWidget {
  final String title;
  final String description;

  DietCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0), // Espaço entre o título e a descrição
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
