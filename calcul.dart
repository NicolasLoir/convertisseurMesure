final Map<String, int> mesuresMap = {
  'mètres': 0,
  'kilomètre': 1,
  'grammes': 2,
  'kilogrammes': 3,
  'pieds': 4,
  'miles': 5,
  'livres': 6,
  'onces': 7
};

final dynamic formules = {
  '0': [1.0, 0.001, 0.0, 0.0, 3.28084, 0.000621371, 0.0, 0.0],
  '1': [1000.0, 1.0, 0.0, 0.0, 3280.84, 0.621371, 0.0, 0.0],
  '2': [0.0, 0.0, 1.0, 0.0001, 0.0, 0.0, 0.00220462, 0.035274],
  '3': [0.0, 0.0, 1000.0, 1.0, 0.0, 0.0, 2.20462, 35.274],
  '4': [0.3048, 0.0003048, 0.0, 0.0, 1.0, 0.000189394, 0.0, 0.0],
  '5': [1609.34, 1.60934, 0.0, 0.0, 5280.0, 1.0, 0.0, 0.0],
  '6': [0.0, 0.0, 453.592, 0.453592, 0.0, 0.0, 1.0, 16],
  '7': [0.0, 0.0, 28.3495, 0.0283495, 0.0, 0.0, 0.0625, 1.0],
};

String convertir(double? valeur, String? depuis, String? vers) {
  int numDepuis = mesuresMap[depuis] ?? 0;
  int numVers = mesuresMap[vers] ?? 0;
  double multiplicateur = formules[numDepuis.toString()][numVers];
  if (multiplicateur == 0) {
    return 'Conversion impossible';
  }
  double resultat = valeur! * multiplicateur;
  return resultat.toString();
}

//récupérer la valeur
int? maValeur = mesuresMap['miles'];
