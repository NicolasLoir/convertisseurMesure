import 'package:flutter/material.dart';
import 'package:tp1_convertisseur_mesures/calcul.dart';

final TextStyle styleEntree = TextStyle(
  fontSize: 20,
  color: Colors.blue[900],
);
final TextStyle styleLabel = TextStyle(
  fontSize: 20,
  color: Colors.grey[700],
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Convertisseur de mesure'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _nombreSaisi;
  String? _dropdownDepuis;
  String? _dropdownVers;
  String? _message;

  @override
  void initState() {
    super.initState();
    _nombreSaisi = 0.0;
    _dropdownDepuis = mesuresMap.keys.first;
    _dropdownVers = mesuresMap.keys.last;
    _message = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Spacer(),
                Text(
                  'Valeur à convertir:',
                  style: styleEntree,
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Saisissez la mesure à convertir',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (texte) {
                        var vr = double.tryParse(texte);
                        if (vr == null) vr = 0;
                        setState(() {
                          _nombreSaisi = vr;
                        });
                      }),
                ),
                Spacer(),
                Text(
                  'Depuis',
                  style: styleLabel,
                ),
                Spacer(),
                DropdownButton<String>(
                  value: _dropdownDepuis,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 50,
                  elevation: 16,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 20),
                  underline: Container(
                    height: 2,
                    color: Colors.red,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownDepuis = newValue;
                    });
                  },
                  items: mesuresMap.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Spacer(),
                Text(
                  'Vers',
                  style: styleLabel,
                ),
                Spacer(),
                DropdownButton<String>(
                  value: _dropdownVers,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 50,
                  elevation: 16,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 20),
                  underline: Container(
                    height: 2,
                    color: Colors.red,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownVers = newValue;
                    });
                  },
                  items: mesuresMap.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _message = convertir(
                          _nombreSaisi, _dropdownDepuis, _dropdownVers);
                    });
                  },
                  child: Text(
                    'Convertir',
                    style: styleEntree,
                  ),
                ),
                Spacer(),
                Text(
                  _message!,
                ),
                Spacer(flex: 8)
              ],
            ),
          ),
        ));
  }
}
