import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/model/entity_offline/work/businessmen_items.dart';

class BusinessmenListView extends StatelessWidget {
  final int id;

  const BusinessmenListView({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 30,
        width: 200,
        child: Column(
          children: [
            Expanded(
                flex: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    '${allBusiness[id].image}',
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '${allBusiness[id].title}',
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
