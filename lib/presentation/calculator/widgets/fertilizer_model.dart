class Fertilizer {
  final String title;
  final String amountofN;
  final String amountofP;
  final String amountofK;

  Fertilizer({
    required this.title,
    required this.amountofN,
    required this.amountofP,
    required this.amountofK,
  });
}

// data for first dropdown
List<Fertilizer> fertilizerData = [
  Fertilizer(
    title: "Granules 8-3-1",
    amountofN: '8',
    amountofP: '3',
    amountofK: '1',
  ),
  Fertilizer(
    title: "Nitrogen 16-0-0",
    amountofN: '16',
    amountofP: '0',
    amountofK: '0',
  ),
  Fertilizer(
      title: "Phosphorus Fertilizer 0-9-0",
      amountofN: '0',
      amountofP: '9',
      amountofK: '0'),
  Fertilizer(
      title: "Seaweed Powder Soluble 0-0-16",
      amountofN: '0',
      amountofP: '0',
      amountofK: '16'),
  Fertilizer(
      title: "Soluble Corn Steep Powder 7-6-4",
      amountofN: '7',
      amountofP: '6',
      amountofK: '4'),
  Fertilizer(
    title: "Other",
    amountofN: '8',
    amountofP: '3',
    amountofK: '2',
  ),
];

// data for second dropdown
List<Fertilizer> fertilizerData1 = [
  Fertilizer(
    title: "Water",
    amountofN: '0',
    amountofP: '0',
    amountofK: '0',
  ),
  Fertilizer(
    title: "Grower's Secret Professional",
    amountofN: '0.35',
    amountofP: '0.05',
    amountofK: '1',
  ),
  Fertilizer(
      title: "Grower's Secret Microbes",
      amountofN: '16',
      amountofP: '0',
      amountofK: '0'),
  Fertilizer(
      title: "Liquid Nitrogen 8-0-0",
      amountofN: '8',
      amountofP: '0',
      amountofK: '0'),
  Fertilizer(
    title: "Other",
    amountofN: '8',
    amountofP: '3',
    amountofK: '2',
  ),
];
