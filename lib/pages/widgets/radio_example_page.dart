import 'package:flutter/material.dart';

class RadioExamplePage extends StatefulWidget {
  const RadioExamplePage({Key? key}) : super(key: key);

  @override
  _RadioExamplePageState createState() => _RadioExamplePageState();
}

class _RadioExamplePageState extends State<RadioExamplePage> {
  String _favorite = "IOS";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Selecciona tu Sistema Operativo Favorito"),
              MyRadio<String>(
                  value: "IOS",
                  groupValue: _favorite,
                  onChanged: (value) {
                    setState(() {
                      _favorite = value!;
                    });
                  },
                  label: "ANDROID"),
              MyRadio<String>(
                  value: "ANDROID",
                  groupValue: _favorite,
                  onChanged: (value) {
                    setState(() {
                      _favorite = value!;
                    });
                  },
                  label: "ANDROID"),
              RadioListTile<String>(
                value: "IOS",
                groupValue: _favorite,
                onChanged: (value) {
                  setState(() {
                    _favorite = value!;
                  });
                },
                title: const Text("IOS"),
              ),
              /*  Row(
                children: [
                  Radio<String>(
                    value: "IOS",
                    groupValue: _favorite,
                    onChanged: (value) {
                      setState(() {
                        _favorite = value!;
                      });
                    },
                  ),
                  const Text("IOS"),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: "ANDROID",
                    groupValue: _favorite,
                    onChanged: (value) {
                      setState(() {
                        _favorite = value!;
                      });
                    },
                  ),
                  const Text("ANDROID"),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: "WINDOWS PHONE",
                    groupValue: _favorite,
                    onChanged: (value) {
                      setState(() {
                        _favorite = value!;
                      });
                    },
                  ),
                  const Text("WINDOWS PHONE"),
                ],
              )
             */
            ],
          ),
        ),
      ),
    );
  }
}

class MyRadio<T> extends StatelessWidget {
  final T value, groupValue;
  final void Function(T?) onChanged;
  final String label;
  const MyRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 30,
          child: Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(label))
      ],
    );
  }
}
