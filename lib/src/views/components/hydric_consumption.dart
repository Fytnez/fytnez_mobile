import 'package:flutter/material.dart';

class HydricConsumption extends StatefulWidget {
  @override
  _HydricConsumptionState createState() => _HydricConsumptionState();
}

class _HydricConsumptionState extends State<HydricConsumption> {
  List<bool> isGlassFullList = [false];
  int qntyConsumption = 200;

  void _toggleGlass(int index) {
    setState(() {
      if (!isGlassFullList[index]) {
        isGlassFullList.add(false);
        isGlassFullList[index] = true;
      } else {
        isGlassFullList.removeRange(index + 1, isGlassFullList.length);
        isGlassFullList[index] = false;
      }
    });
  }

  void _openChangeValueDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int newValue = qntyConsumption;
        return AlertDialog(
          title: Text('Alterar Valor do Copo (ml)'),
          content: TextFormField(
            keyboardType: TextInputType.number,
            initialValue: qntyConsumption.toString(),
            onChanged: (value) {
              newValue = int.tryParse(value) ?? qntyConsumption;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Salvar'),
              onPressed: () {
                if (newValue >= 200 && newValue <= 2000) {
                  setState(() {
                    qntyConsumption = newValue;
                  });
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'O valor do copo deve estar entre 200 e 2000 ml.',
                    ),
                  ));
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int dailyConsumption =
        isGlassFullList.where((filled) => filled).length * qntyConsumption;

    return SingleChildScrollView(
      // Adicione o SingleChildScrollView
      child: Column(
        children: [
          Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Consumo Diário: $dailyConsumption ml',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _openChangeValueDialog,
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Wrap(
                      spacing: 16.0,
                      runSpacing: 16.0,
                      children: List.generate(isGlassFullList.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            _toggleGlass(index);
                          },
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child: isGlassFullList[index]
                                ? Image.asset(
                                    'assets/glass-of-water-complete.png',
                                    key: ValueKey<int>(index),
                                    height: 65,
                                  )
                                : Image.asset(
                                    'assets/glass-of-water.png',
                                    key: ValueKey<int>(index),
                                    height: 65,
                                  ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
