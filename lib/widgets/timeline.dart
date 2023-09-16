import 'package:flutter/material.dart';

class ProcessCard {
  String title;
  String description;
  IconData icon;
  String date;

  ProcessCard(this.title, this.description, this.date, this.icon);
}

class Timeline extends StatefulWidget {
  final List<ProcessCard> activities;

  const Timeline({
    Key? key,
    this.activities = const [],
  }) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<Color> colors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.green,
    Colors.pinkAccent,
    Colors.blue,
  ];
  List<ProcessCard> _getProcess(List<ProcessCard> activities) {
    List<ProcessCard> processCard = [];

    processCard.add(ProcessCard(
        "Third Instance - Judgement Rendered",
        "The claim is settled in the court of Switzerland.",
        "31st of January, 2024",
        Icons.bookmark_add_rounded));
    /*processCard.add(ProcessCard(
        "Review Process",
        "The court reviews the claim.",
        "15th of January, 2024",
        Icons.change_circle_rounded));*/
    processCard.add(ProcessCard(
        "Second Instance - Court deliberation",
        "The claim is officially submitted by both parties.",
        "31st of December, 2023",
        Icons.call_merge_rounded));
    activities.reversed.forEach((item) => {
          processCard.add(item),
          colors.insert(3, Colors.blue),
        });
    processCard.add(ProcessCard(
        "First Instance - Exchange of briefs",
        "Final internal review by legal and accounting team.",
        "8th of December, 2023",
        Icons.border_color_rounded));
    processCard.add(ProcessCard(
        "Topic Approval",
        "The claim is reviewed by business responsible Peter.",
        "30th of November, 2023",
        Icons.check));
    processCard.add(ProcessCard("Claim Creation", "Benjamin created the claim.",
        "1st of September, 2023", Icons.adjust_rounded));
    return processCard;
  }

  List<ProcessCard> processCard = [];

  @override
  void initState() {
    super.initState();
    processCard = _getProcess(widget.activities);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: processCard.length,
          itemBuilder: (context, index) {
            return Container(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 2,
                        height: 60,
                        color: index == 0 ? Colors.white : Colors.black,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8, right: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: colors[(index + 1) % colors.length],
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          processCard[index].icon,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 60,
                        color: index == processCard.length - 1
                            ? Colors.white
                            : Colors.black,
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            width: 3,
                            color: colors[(index + 1) % colors.length],
                          ),
                          left: BorderSide(
                            width: 3,
                            color: colors[(index + 1) % colors.length],
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black26,
                          )
                        ]),
                    //height: 140,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            processCard[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colors[(index + 1) % colors.length],
                            ),
                          ),
                          Text(
                            processCard[index].description,
                            style: TextStyle(fontSize: 17, letterSpacing: 1),
                          ),
                          Text(
                            processCard[index].date,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            );
          }),
    );
  }
}
