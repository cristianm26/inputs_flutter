import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  final bool _enabled = false;
  String _day = "Lunes";
  final List<String> _days = [
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
    'Sabado',
    'Domingo'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                value: _enabled,
                title: const Text('Notificaciones Push'),
                onChanged: (value) {
                  setState(() {
                    _enabled;
                  });
                },
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: _day,
                items: List.generate(
                    _days.length,
                    (index) => DropdownMenuItem(
                          child: Text(_days[index]),
                          value: _days[index],
                        ))

                /*  _days
                    .map((e) =>
                        DropdownMenuItem<String>(child: Text(e), value: e))
                    .toList() */
                ,
                onChanged: (value) {
                  setState(() {
                    _day = value!;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
