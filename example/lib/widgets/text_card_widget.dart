import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:flutter/material.dart';


class TextCardWidget extends StatelessWidget {
  final String? value;
  final String? title;

  const TextCardWidget({
    Key? key,
    this.value,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return CardWrapper(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${title ?? ''} not present'),
          ),
        ),
      );
    }
    return _buildResult(value!);
  }

  _buildResult(String value) {
    return CardWrapper(
      child: ListTile(
        title: Text(title ?? ''),
        subtitle: Text(value),
      ),
    );
  }
}
