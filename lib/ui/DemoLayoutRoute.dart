import 'package:flutter/material.dart';

class DemoLayoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DemoLayout'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'images/lake.jpg',
            height: 240.0,
            fit: BoxFit.cover,
          ),
          _buildTitleSection(),
          _buildButtonSection(context),
          _buildTextSection(),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        _buildButtonColum(context, Icons.call, 'CALL'),
        _buildButtonColum(context, Icons.near_me, 'ROUTE'),
        _buildButtonColum(context, Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildButtonColum(BuildContext context, IconData data, String label) {
    Color color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Icon(data, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
  }
}
