import 'package:flutter/material.dart';

class EditClaimScreen extends StatefulWidget {
  @override
  _EditClaimScreenState createState() => _EditClaimScreenState();
}

class _EditClaimScreenState extends State<EditClaimScreen> {
  bool editMode = false;
  Map<String, dynamic> claimData = {
    "division": "Buildings CH",
    "country": "Switzerland",
    "pcNo": "200017",
    "investmentCenterName": "Buildings Gros-Oeuvre Ouest",
    "psp": "1000222",
    "projectDescription": "A",
    "type": "Expected legal case against Implenia",
    "businessResponsible": "Peter",
    "legalResponsible": "Jack",
    "financeResponsible": "Mathias",
    "caseNumber": "1",
    "claimant": "Name A",
    "respondentOfClaim": "Name 1",
    "counterpartyRelation": "Client",
    "proceedingStatus": "First Instance - Exchange of briefs",
    "subjectMatter": "D",
    "currency": "CHF",
    "volume": "-3000",
  };

  Map<String, dynamic> fieldNameMapping = {
    "Division": "division",
    "Country": "country",
    "Project Code": "pcNo",
    "Investment Center": "investmentCenterName",
    "PSP": "psp",
    "Project Description": "projectDescription",
    "Type": "type",
    "Business Responsible": "businessResponsible",
    "Legal Responsible": "legalResponsible",
    "Finance Responsible": "financeResponsible",
    "Case Number": "caseNumber",
    "Claimant": "claimant",
    "Respondent of Claim": "respondentOfClaim",
    "Counterparty Relation": "counterpartyRelation",
    "Proceeding Status": "proceedingStatus",
    "Subject Matter": "subjectMatter",
    "Currency": "currency",
    "Volume": "volume",
  };

  List<String> providedFields = [
    "division",
    "country",
    "type",
    "counterpartyRelation",
    "currency",
    "volume"
  ];

  List<Widget> _getListOfTextFields() {
    return fieldNameMapping.keys.map((key) {
      final value = fieldNameMapping[key];
      return _InfoRow(
          title: key,
          value: claimData[value],
          isProvided: providedFields.contains(value),
          editWidget: _buildEditableField(
              value, claimData[value], providedFields.contains(value)),
          editMode: editMode);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> textFields = [];
    textFields.addAll(_getListOfTextFields());

    final int halfLength = (textFields.length / 2).ceil();

    return SingleChildScrollView(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: editMode
                  ? null
                  : () {
                      setState(() {
                        editMode = !editMode;
                      });
                    },
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: editMode
                  ? () {
                      // Save changes and exit edit mode
                      setState(() {
                        editMode = false;
                      });
                    }
                  : null, // Set onPressed to null when editMode is false
            ),
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: editMode
                  ? () {
                      // Cancel changes and exit edit mode
                      setState(() {
                        editMode = false;
                      });
                    }
                  : null,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                      child: _MoneyBox(
                    icon: Icons.attach_money,
                    title: "Total",
                    value: claimData['volume'],
                    currency: claimData['currency'],
                    color: Colors.indigo,
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: _MoneyBox(
                    icon: Icons.money_off,
                    title: "Paid",
                    value: "1000",
                    currency: claimData['currency'],
                    color: Colors.green,
                  )), // Replace with actual paid amount
                  SizedBox(width: 10),
                  Expanded(
                      child: _MoneyBox(
                    icon: Icons.payment,
                    title: "Due",
                    value: "2000",
                    currency: claimData['currency'],
                    color: Colors.deepOrangeAccent,
                  )), // Replace with actual due amount
                ],
              ),
              SizedBox(height: 20),
              _SectionTitle(title: "General Info"),
              SizedBox(height: 10),

             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: textFields.sublist(0, halfLength),
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: textFields.sublist(halfLength),
                 ),
               ],
             ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildEditableField(
      String field, String initialValue, bool isProvided) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      style: TextStyle(color: isProvided ? Colors.black : Colors.grey),
      onChanged: (newValue) {
        // Update the claimData map with the new value
        setState(() {
          claimData[field] = newValue;
        });
      },
    );
  }
}

class _MoneyBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String currency;
  final Color color;

  _MoneyBox(
      {required this.icon,
      required this.title,
      required this.value,
      required this.currency,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color, // Change the color as needed
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          Text(title, style: TextStyle(color: Colors.white)),
          Expanded(child: Center()),
          Text("$value $currency", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue, // Change the color as needed
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isProvided;
  final bool editMode;
  final Widget editWidget;

  _InfoRow(
      {required this.title,
      required this.value,
      required this.isProvided,
      required this.editWidget,
      required this.editMode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 200,
            child: editMode
                ? editWidget
                : Padding(
                    padding: EdgeInsets.all(18),
                    child: Text(value,
                        style: TextStyle(
                            color: isProvided ? Colors.black : Colors.grey)),
                  ),
          )
        ],
      ),
    );
  }
}
