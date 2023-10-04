import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  static const String _routeName = '/diet';

  static String getRouteName() => _routeName;

  const DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 41, 48, 0.95),
      appBar: AppBar(
        title: Text('Dieta'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16.0), // Espaço superior
              RoundedIconButton(
                // Botão de adição
                onPressed: () {
                  // Ação ao pressionar o botão de adição
                },
                icon: Icons.add,
                backgroundColor: Colors.green,
                iconColor: Colors.white,
              ),
              SizedBox(height: 16.0), // Espaço entre o botão e os cards
              DietCard(
                title: 'Refeição 1',
                description: 'Descrição da Refeição 1',
                calories: '500', // Adicione o valor calórico aqui
                image:
                    AssetImage('assets/meal1.jpg'), // Adicione sua imagem aqui
                nutrients: [
                  '30g', // Proteína
                  '45g', // Carboidratos
                  '12g', // Gorduras
                ], // Adicione os nutrientes aqui
              ),
              SizedBox(height: 16.0), // Altura entre os cards
              DietCard(
                title: 'Refeição 2',
                description: 'Descrição da Refeição 2',
                calories: '350', // Adicione o valor calórico aqui
                image:
                    AssetImage('assets/meal2.jpg'), // Adicione sua imagem aqui
                nutrients: [
                  '25g', // Proteína
                  '40g', // Carboidratos
                  '10g', // Gorduras
                ], // Adicione os nutrientes aqui
              ),
              SizedBox(height: 16.0), // Altura entre os cards
              DietCard(
                title: 'Refeição 3',
                description: 'Descrição da Refeição 3',
                calories: '600', // Adicione o valor calórico aqui
                image:
                    AssetImage('assets/meal3.jpg'), // Adicione sua imagem aqui
                nutrients: [
                  '35g', // Proteína
                  '50g', // Carboidratos
                  '15g', // Gorduras
                ], // Adicione os nutrientes aqui
              ),
              SizedBox(height: 16.0), // Altura entre os cards
              DietCard(
                title: 'Refeição 4',
                description: 'Descrição da Refeição 4',
                calories: '450', // Adicione o valor calórico aqui
                image:
                    AssetImage('assets/meal4.jpg'), // Adicione sua imagem aqui
                nutrients: [
                  '28g', // Proteína
                  '42g', // Carboidratos
                  '11g', // Gorduras
                ], // Adicione os nutrientes aqui
              ),
              SizedBox(height: 16.0), // Altura entre os cards
              DietCard(
                title: 'Refeição 5',
                description: 'Descrição da Refeição 5',
                calories: '550', // Adicione o valor calórico aqui
                image:
                    AssetImage('assets/meal5.jpg'), // Adicione sua imagem aqui
                nutrients: [
                  '32g', // Proteína
                  '48g', // Carboidratos
                  '13g', // Gorduras
                ], // Adicione os nutrientes aqui
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
  final String calories;
  final ImageProvider image;
  final List<String> nutrients;

  DietCard({
    required this.title,
    required this.description,
    required this.calories,
    required this.image,
    required this.nutrients,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9 * MediaQuery.of(context).size.width,
      child: Card(
        elevation: 4.0,
        color: Color.fromRGBO(54, 66, 81, 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Imagem
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150.0, // Largura da imagem
                height: 200.0, // Altura da imagem
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Título, Valor Calórico e Nutrientes
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Título e Valor Calórico
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Calorias: $calories',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Descrição
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Nutrientes (Proteína, Carboidratos, Gorduras)
                    Row(
                      children: <Widget>[
                        Text(
                          'Proteína: ${nutrients[0]}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.lightBlue,
                          ),
                        ),
                        SizedBox(width: 16.0), // Espaço entre os nutrientes
                        Text(
                          'Carboidratos: ${nutrients[1]}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.lightBlue,
                          ),
                        ),
                        SizedBox(width: 16.0), // Espaço entre os nutrientes
                        Text(
                          'Gorduras: ${nutrients[2]}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  RoundedIconButton({
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
