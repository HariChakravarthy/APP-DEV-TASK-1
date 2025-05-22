import 'package:flutter/material.dart';
const Color primaryBrown = Color(0xFF7B3F00);

class my_OutlinedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const my_OutlinedButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        side: BorderSide(
          color: isSelected ? Color(0xFF7B3F00) : Colors.black12,
          width: 1.25,
        ),
        backgroundColor: isSelected ? Color(0xFF7B3F00).withOpacity(0.2) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: isSelected ? Color(0xFF7B3F00) : Colors.black,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 28,
            child: Icon(
              icon,
              color: isSelected ? Color(0xFF7B3F00) : Colors.black,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: isSelected ? Color(0xFF7B3F00) : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

