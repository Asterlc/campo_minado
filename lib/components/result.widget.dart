import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  // const Result({Key? key}) : super(key: key);
  final bool? winner;
  final Function onRestart;

  ResultWidget({
    this.winner,
    required this.onRestart,
  });

  Color _getColor() {
    if (winner == null) {
      return Colors.yellow;
    } else if (winner!) {
      return Colors.green.shade300;
    } else
      return Colors.red.shade300;
  }

  IconData _getIcons() {
    if (winner == null) {
      return Icons.sentiment_satisfied;
    } else if (winner!) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () => onRestart,
              icon: Icon(
                _getIcons(),
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
