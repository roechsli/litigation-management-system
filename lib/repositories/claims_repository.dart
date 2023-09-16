


class ClaimsRepository{
  static var claims = [frenchClaim, germanClaim];

}

class ClaimInfo {
  String division;
  String country;
  String pcNo;
  String investmentCenterName;
  String psp;
  String projectDescription;
  String type;
  String businessResponsible;
  String legalResponsible;
  String financeResponsible;
  String caseNumber;
  String claimant;
  String respondentOfClaim;
  String counterpartyRelation;
  String proceedingStatus;
  String subjectMatter;
  String currency;
  String volume;

  ClaimInfo({
    required this.division,
    required this.country,
    required this.pcNo,
    required this.investmentCenterName,
    required this.psp,
    required this.projectDescription,
    required this.type,
    required this.businessResponsible,
    required this.legalResponsible,
    required this.financeResponsible,
    required this.caseNumber,
    required this.claimant,
    required this.respondentOfClaim,
    required this.counterpartyRelation,
    required this.proceedingStatus,
    required this.subjectMatter,
    required this.currency,
    required this.volume,
  });
}

ClaimInfo swissClaim = ClaimInfo(
  division: "Buildings CH",
  country: "Switzerland",
  pcNo: "200017",
  investmentCenterName: "Buildings Gros-Oeuvre Ouest",
  psp: "1000222",
  projectDescription: "A",
  type: "Expected legal case against Implenia",
  businessResponsible: "Peter",
  legalResponsible: "Jack",
  financeResponsible: "Mathias",
  caseNumber: "1",
  claimant: "Name A",
  respondentOfClaim: "Name 1",
  counterpartyRelation: "Client",
  proceedingStatus: "First Instance - Exchange of briefs",
  subjectMatter: "D",
  currency: "CHF",
  volume: "-3000",
);

ClaimInfo germanClaim = ClaimInfo(
  division: "German Division",
  country: "Germany",
  pcNo: "200018",
  investmentCenterName: "German Investment Center",
  psp: "1000223",
  projectDescription: "B",
  type: "Legal case related to construction",
  businessResponsible: "Hans",
  legalResponsible: "Greta",
  financeResponsible: "Klaus",
  caseNumber: "2",
  claimant: "Name B",
  respondentOfClaim: "Name 2",
  counterpartyRelation: "Contractor",
  proceedingStatus: "Pre-trial negotiations",
  subjectMatter: "E",
  currency: "EUR",
  volume: "-2500",
);

ClaimInfo frenchClaim = ClaimInfo(
  division: "French Division",
  country: "France",
  pcNo: "200019",
  investmentCenterName: "French Investment Center",
  psp: "1000224",
  projectDescription: "C",
  type: "Legal dispute regarding contracts",
  businessResponsible: "Marie",
  legalResponsible: "Jean",
  financeResponsible: "Sophie",
  caseNumber: "3",
  claimant: "Name C",
  respondentOfClaim: "Name 3",
  counterpartyRelation: "Supplier",
  proceedingStatus: "Arbitration",
  subjectMatter: "F",
  currency: "EUR",
  volume: "-5000",
);
