import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../data/model/dailly_event_model.dart';

class CardMedicationWidget extends StatelessWidget {
  final DaillyEventModel event;
  final Function(String, bool) onCheck;
  const CardMedicationWidget({
    Key? key,
    required this.event,
    required this.onCheck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.medication.type,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                            // border: Border.all(color: Colors.grey.shade300),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(event.medication.name, style: TextStyle(color: Colors.black45, fontSize: 16),),
                      ],
                    )
                  ],
                ),
                Image.asset(
                  'assets/some_icon.png',
                  height: 80,
                  width: 80,
                )
              ],
            ),
            Divider(
              color: Colors.grey[300],
            ),
            //
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          'Tomada - Seg, 12 dez - as 13:40',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          LineIcons.coins,
                          size: 25,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          event.medication.dosage,
                          style: TextStyle(color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
                Checkbox(
                  value: event.isTaken,
                  onChanged: (value) {
                    // setState(() {
                    //   _isChecked = value!;
                    // });
                    onCheck(event.id, value!);
                  },
                  // Define a cor do fundo do checkbox
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.green; // Cor quando está marcado
                    }
                    // return Colors.red; // Cor quando está desmarcado
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
