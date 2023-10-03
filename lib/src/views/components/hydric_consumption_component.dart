import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HydricConsumptionComponent extends StatefulWidget {
  @override
  _HydricConsumptionComponentState createState() => _HydricConsumptionComponentState();
}

class _HydricConsumptionComponentState extends State<HydricConsumptionComponent> {
  List<Widget> quadrados = [];
  int consumoDiario = 0;
  int copo = 200;
  double containerHeight = 180.0;
  double maxContainerHeight = 180.0;
  final ScrollController _controller = ScrollController();
  final FocusNode _addCopoButtonFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _resetAndSaveDailyConsumption();
  }

  Future<void> _resetAndSaveDailyConsumption() async {
    final prefs = await SharedPreferences.getInstance();

    final lastResetDate = prefs.getString('last_reset_date');
    final currentDate = DateTime.now().toLocal().toString().substring(0, 10);

    if (lastResetDate != currentDate) {
      setState(() {
        consumoDiario = 0;
      });

      await prefs.setInt('daily_consumption', consumoDiario);
      await prefs.setString('last_reset_date', currentDate);
    } else {
      setState(() {
        consumoDiario = prefs.getInt('daily_consumption') ?? 0;
      });
    }
  }

  void _updateContainerHeight() {
    if (quadrados.length < 15) {
      final rowCount = (quadrados.length / 3).ceil();
      final newHeight = maxContainerHeight + (rowCount - 2) * 50;
      setState(() {
        containerHeight = newHeight;
      });
    }

    _controller.jumpTo(_controller.position.maxScrollExtent);

    FocusScope.of(context).requestFocus(_addCopoButtonFocusNode);
  }

  @override
  void dispose() {
    _addCopoButtonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: ListView(
              controller: _controller,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: _openCopoConfigDialog,
                  alignment: Alignment.topLeft,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Consumo diário: $consumoDiario'),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: quadrados,
                      ),
                      ElevatedButton(
                        onPressed: _addQuadrado,
                        child: Text('Adicionar Copo'),
                        focusNode: _addCopoButtonFocusNode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openCopoConfigDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CopoConfigDialog(
          copo: copo,
          onCopoChanged: (newCopo) {
            setState(() {
              copo = newCopo;
            });
          },
        );
      },
    );
  }

  void _addQuadrado() async {
    setState(() {
      quadrados.add(
        Container(
          width: 50,
          height: 50,
          color: Colors.blue,
          margin: EdgeInsets.all(5),
        ),
      );
      consumoDiario += copo;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('daily_consumption', consumoDiario);

    FocusScope.of(context).requestFocus(_addCopoButtonFocusNode);
  }
}

class CopoConfigDialog extends StatefulWidget {
  final int copo;
  final ValueChanged<int> onCopoChanged;

  CopoConfigDialog({required this.copo, required this.onCopoChanged});

  @override
  _CopoConfigDialogState createState() => _CopoConfigDialogState();
}

class _CopoConfigDialogState extends State<CopoConfigDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.copo.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Configurar Copo'),
      content: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Novo valor para o copo'),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final newCopo = int.tryParse(_controller.text) ?? widget.copo;
            widget.onCopoChanged(newCopo);
            Navigator.of(context).pop();
          },
          child: Text('Salvar'),
        ),
      ],
    );
  }
}
