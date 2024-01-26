import 'package:draggable_dragtarget/models/sandal.dart';
import 'package:flutter/material.dart';

class CardSaya extends StatefulWidget {
  final Function(String) onDrag;
  const CardSaya({Key? key, required this.onDrag}) : super(key: key);

  @override
  State<CardSaya> createState() => _CardSayaState();
}

class _CardSayaState extends State<CardSaya> {
  List<Sepatu> sendal = Sepatu.getSepatu();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom
            crossAxisSpacing: 8.0, // Spasi antar kolom
            mainAxisSpacing: 8.0, // Spasi antar baris
          ),
          itemCount: sendal.length, // Jumlah card
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Center(
                  child: Draggable<String>(
                data: sendal[index].foto.toString(),
                feedback: Image(
                  image: AssetImage("assets/${sendal[index].foto.toString()}"),
                  width: 200,
                ),
                childWhenDragging: Image(
                  image: AssetImage("assets/${sendal[index].foto.toString()}"),
                  width: 200,
                ),
                onDragCompleted: () =>
                    widget.onDrag(sendal[index].foto.toString()),
                child: Image(
                  image: AssetImage("assets/${sendal[index].foto.toString()}"),
                  width: 200,
                ),
              )),
            );
          },
        ),
      ),
    );
  }
}
