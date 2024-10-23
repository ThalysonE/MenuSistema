
import 'package:flutter/material.dart';
import 'package:teste/modelo.dart';
import 'package:teste/theme.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white54)
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectIndex = 0;
  var menuAtivado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          
          NavigationRail(
            extended: menuAtivado,
            leading: SizedBox(
              height: 50,
              width: menuAtivado? 256: 80,
              child: Row(
                mainAxisAlignment: menuAtivado? MainAxisAlignment.spaceAround: MainAxisAlignment.center,
                children: [
                menuAtivado? SizedBox(width: 110,height: 35,child: Placeholder(),): SizedBox(width: 0), 
                IconButton(
                  
                  onPressed: (){
                    setState(() {
                      menuAtivado = !menuAtivado;
                    });
                  },
                  icon: Icon(Icons.menu, size: 29))
                ],
              ),
            ),
            selectedIndex: selectIndex,
            destinations: [
              for(MenuModelo menuItem in menuItens)
                NavigationRailDestination(
            
                  icon: Icon(menuItem.icon),
                  label: Text(menuItem.item,style: defaultFontMenu,),
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings), 
                  label: Text('Configurações',style: defaultFontMenu,), 
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.logout), 
                  label: Text('Sair',style: defaultFontMenu,), 
                  padding: EdgeInsets.symmetric(vertical: 8),
                  indicatorColor: Colors.red,
                  indicatorShape: CircleBorder()
                )
            ],
            onDestinationSelected: (value){
              setState(() {
                selectIndex = value;
              });
            },
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              child: Placeholder(),
            )
          )
        ],
      )
    );
  }
}