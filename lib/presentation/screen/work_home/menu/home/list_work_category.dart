import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/model/entity_offline/work/work_category.dart';

class ChildWorkCategory extends StatelessWidget {
  final int id;
  ChildWorkCategory({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
          width: MediaQuery.of(context).size.width / 5,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: null,
                  ),
                  Image.asset(
                    '${allWork[id].image}',
                    width: 20,
                    height: 20,
                    color: Colors.blue,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text('${allWork[id].title}'),
            ],
          )),
    );
  }
}
