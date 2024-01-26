import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainCard extends StatefulWidget {
  final Function(String) onAccept;
  const MainCard({Key? key, required this.onAccept}) : super(key: key);

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> with TickerProviderStateMixin {
  late AnimationController _controller;
  double waveAplitude = 10.0;
  bool assets = false;
  String? acceptedValue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: .5,
              child: Text(
                "NIKE",
                style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.1),
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double waveOffset = waveAplitude * 2 * _controller.value;
                return Transform.translate(
                  offset: Offset(0.0, waveOffset),
                  child: child,
                );
              },
              child: DragTarget<String>(
                onWillAccept: (value) => true,
                onAccept: (value) {
                  setState(() {
                    acceptedValue = value;
                  });
                  widget.onAccept(value);
                },
                builder: (context, candidateData, rejectedData) {
                  // Dapatkan nilai yang diterima
                  return Image.asset(
                    acceptedValue != null
                        ? "assets/$acceptedValue"
                        : "assets/nike main.png",
                    width: 350,
                    height: 350,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
