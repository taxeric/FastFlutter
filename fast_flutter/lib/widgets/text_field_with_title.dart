import 'package:flutter/material.dart';

class TextFieldWithTitle extends StatefulWidget {

  final String title;
  final String? defValue;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;

  const TextFieldWithTitle({super.key, required this.title, this.defValue, this.inputType, this.onChanged});

  @override
  State<TextFieldWithTitle> createState() => _TextFieldWithTitleState();
}

class _TextFieldWithTitleState extends State<TextFieldWithTitle> {

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = widget.defValue?? "";
    if (widget.defValue != null && widget.defValue!.isNotEmpty) {
      widget.onChanged!.call(widget.defValue!);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Align(
                alignment: Alignment.center,
                child: Text(widget.title),
              )
          ),
          Flexible(
            flex: 3,
            child: TextField(
              controller: _controller,
              keyboardType: widget.inputType,
              onChanged: widget.onChanged,
              decoration: const InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
