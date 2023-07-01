import 'package:flutter/material.dart';

class CustomTileItem extends StatefulWidget {
  const CustomTileItem({super.key, required this.onPressed, required this.itemTitle, required this.iconData});
  final VoidCallback onPressed;
  final String itemTitle;
  final IconData iconData;
  

  @override
  State<CustomTileItem> createState() => _CustomTileItemState();
}

class _CustomTileItemState extends State<CustomTileItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: GestureDetector(
        onTap:widget.onPressed,
        child:  Row(
          children: [
            Icon(widget.iconData),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.itemTitle,
              style:const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0),
            )
          ],
        ),
      ),
    );
  }
}
