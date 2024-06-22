import 'package:flutter/material.dart';

class NeumorphicSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const NeumorphicSlider({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-2, -2),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 8.0,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
          thumbColor: Colors.white,
          overlayColor: Colors.white.withOpacity(0.2),
          activeTrackColor: Colors.grey[700],
          inactiveTrackColor: Colors.grey[300],
          trackShape: RoundedRectSliderTrackShape(),
        ),
        child: Slider(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
