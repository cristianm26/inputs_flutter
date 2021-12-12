import 'package:flutter/material.dart';
import 'package:inputs/pages/widgets/my_text_field.dart';

class TextFieldsPage extends StatefulWidget {
  const TextFieldsPage({Key? key}) : super(key: key);

  @override
  State<TextFieldsPage> createState() => _TextFieldsPageState();
}

class _TextFieldsPageState extends State<TextFieldsPage> {
  String _email = '', _password = '';
  final FocusNode _focusNodePassword = FocusNode();
  bool _terms = false;

  void _submit() {
    // ignore: avoid_print
    print('Email: $_email');
    // ignore: avoid_print
    print('Password: $_password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFields'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                MyTextField(
                  icon: Icons.email_outlined,
                  label: "Email",
                  hint: "Ingrese su Email",
                  defaultValue: "contacto@gmail.com",
                  onChanged: (String text) {
                    _email = text;
                  },
                  onSubmitted: (_) => _focusNodePassword.requestFocus(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 25,
                      child: Checkbox(
                        value: _terms,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {
                          setState(() {
                            _terms = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _terms = !_terms;
                          });
                        },
                        child: const Text("Terminos y condiciones"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  icon: Icons.lock_outlined,
                  label: "Password",
                  focusNode: _focusNodePassword,
                  obscureText: true,
                  hint: "Ingrese su Password",
                  onChanged: (String text) {
                    _password = text;
                  },
                ),
                /*  TextField(
                  onChanged: (String text) {
                    _password = text;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Ingrese su password',
                  ),
                ), */
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: _submit,
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: const Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
