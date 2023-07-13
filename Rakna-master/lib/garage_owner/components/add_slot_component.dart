import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakna/presentation/screens/slot_selection.dart';

class AddSlotComponent extends StatefulWidget {
  const AddSlotComponent({
    Key? key,
    required this.name,
    required this.textName,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  final String name;
  final String textName;
  final Color color;
  final GestureTapCallback onTap;

  @override
  State<AddSlotComponent> createState() => _AddSlotComponentState();
}

class _AddSlotComponentState extends State<AddSlotComponent> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:InkWell(
              onTap: widget.onTap,
              child: Container(
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey.shade400),
                    color: widget.color,
                    borderRadius: BorderRadius.circular(5)),
                width: 84,
                height: 36,
                child: Center(
                  child: Icon(Icons.add,color: Colors.white,)
                ),
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.textName,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

