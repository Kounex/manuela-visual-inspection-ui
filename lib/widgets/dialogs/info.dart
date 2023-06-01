import 'package:flutter/material.dart';

import '../base/ui/checkbox.dart';

class InfoDialog extends StatefulWidget {
  final String? title;
  final String body;

  final bool enableDontShowAgainOption;

  final Function(bool checked)? onPressed;

  const InfoDialog({
    Key? key,
    required this.body,
    this.title,
    this.enableDontShowAgainOption = false,
    this.onPressed,
  }) : super(key: key);

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  bool _dontShowChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title != null
          ? Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(widget.title!),
            )
          : null,
      content: Column(
        children: [
          Text(
            widget.body,
            textAlign: TextAlign.center,
          ),
          if (widget.enableDontShowAgainOption)
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Transform.translate(
                offset: const Offset(-4, 0),
                child: Row(
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: BaseCheckbox(
                        value: _dontShowChecked,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (checked) =>
                            setState(() => _dontShowChecked = checked!),
                      ),
                    ),
                    const Text('Don\'t show this again'),
                  ],
                ),
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onPressed?.call(_dontShowChecked);
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
