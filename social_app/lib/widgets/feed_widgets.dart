import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  final width = 80.0;
  final height = 80.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: height,
          width: width,
          margin: EdgeInsets.only(left: 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '24',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'photos',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: height,
          width: width,
          margin: EdgeInsets.only(left: 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[300],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '48',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              Text('articles'),
            ],
          ),
        ),
        Container(
          height: height,
          width: width,
          margin: EdgeInsets.only(left: 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[300],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '22k',
                style: TextStyle(color: Colors.indigo, fontSize: 20),
              ),
              Text('followers'),
            ],
          ),
        ),
      ],
    );
  }
}

class TopicList extends StatelessWidget {
  final List<String> _topics = [
    'CHAT',
    'FEATURED',
    'POPULAR',
    'FOLLOWING',
    'NEW',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _topics.length,
        itemBuilder: (context, index) => Container(
          height: 24,
          padding: EdgeInsets.all(6),
          margin: EdgeInsets.only(left: 16, bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: (index == 0)
                ? Colors.orange.withOpacity(0.3)
                : Colors.transparent,
          ),
          child: Text(
            _topics[index],
            style: TextStyle(
              color: (index == 0) ? Colors.orange : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 12),
          child: Text(
            'My Photos',
            style: TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 120,
          margin: EdgeInsets.only(left: 16, bottom: 24),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return (index == 0)
                  ? Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.add, color: Colors.grey, size: 30),
                    )
                  : Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[350],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/dp.jpg',
                          ),
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
}

class VideoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 12),
          child: Text(
            'My Videos',
            style: TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 130,
          margin: EdgeInsets.only(left: 16, bottom: 24),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    width: 180,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[350],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/motor.jpg',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
