import 'package:flutter/material.dart';

class ServiceGridBuilder extends StatefulWidget {
  const ServiceGridBuilder({
    super.key,
    required this.services,
  });

  final List<String> services;

  @override
  State<ServiceGridBuilder> createState() => _ServiceGridBuilderState();
}

class _ServiceGridBuilderState extends State<ServiceGridBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.services.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 4.0, // Spacing between rows
          crossAxisSpacing: 4.0),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(80)),
          child: SizedBox(
            child: GestureDetector(
              onTap: () {
                widget.services.removeAt(index);
                setState(() {});
              },
              child: Chip(
                  padding: EdgeInsets.all(0),
                  side: BorderSide.none,
                  backgroundColor: Colors.grey[200],
                  label: SizedBox(
                      width: double.infinity,
                      child: Text(widget.services[index]))),
            ),
          ),
        );
      },
    );
  }
}