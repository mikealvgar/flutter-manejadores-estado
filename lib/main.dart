import 'package:counter_app/services/usuario_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/pages/page1_page.dart';
import 'package:counter_app/pages/page2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioServices())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1Page(),
          'pagina2': (_) => Pagina2Page()
        },
      ),
    );
  }
}