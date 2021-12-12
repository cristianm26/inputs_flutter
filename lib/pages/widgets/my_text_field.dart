import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label, hint;
  final IconData icon;
  final bool obscureText;
  final String defaultValue;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  const MyTextField({
    Key? key,
    this.onChanged,
    this.label = "",
    this.hint = "",
    required this.icon,
    this.obscureText = false,
    this.defaultValue = "",
    this.focusNode,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _hasFocus = false, _obscureText = false;

  late FocusNode _focusNode;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;
    _controller.text = widget.defaultValue;

    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = _hasFocus ? Colors.redAccent : Colors.grey;
    return TextField(
      focusNode: _focusNode,
      //Para deshabilitar el autocorrector
      autocorrect: false,
      // Solo lectura
      // readOnly: true,
      // Para ocultar password
      //obscureText: true,
      obscureText: _obscureText,
      controller: _controller,
      maxLines: null,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: TextStyle(
          color: color,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: color,
        ),
        suffixIcon: widget.obscureText
            ? TextButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  minimumSize: Size(MediaQuery.of(context).size.width - 20, 40),
                ),
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : TextButton(
                onPressed: () {
                  _controller.text = "";
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  minimumSize: Size(MediaQuery.of(context).size.width - 20, 40),
                ),
                child: const Icon(Icons.clear),
              ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
