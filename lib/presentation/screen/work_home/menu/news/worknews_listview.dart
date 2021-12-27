import 'package:flutter/material.dart';
import 'package:ybc/model/entity_offline/work/newsItem.dart';
import 'detail_news.dart';
class NewsWorkListView extends StatelessWidget {
  final int id;

  const NewsWorkListView({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailNewsScreen(id: id)),
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                  flex: 5,
                  child: Image.asset('${allNewsItem[id].image}', width: 130, height:  120, fit: BoxFit.cover,)),
              SizedBox(width: 15,),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${allNewsItem[id].title}', maxLines: 4, overflow: TextOverflow.ellipsis),
                      SizedBox(height: 10,),
                      Text('${allNewsItem[id].category}', maxLines: 1, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),
                      Text('${allNewsItem[id].time}'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
