import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'historico.dart';
import 'minha_conta.dart';

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {

  final textStyles = Theme.of(context).textTheme;
    return Scaffold(
       appBar: AppBar(
         title: Text('Perfil'),
        ),
        body: Column(
          children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              color: Color.fromRGBO(224, 170, 255, 1),
            ),  
            height: 200,
            alignment: Alignment.center,
            child: Column(
              children:[
                SizedBox(height: 25,),
                CircleAvatar(child: FaIcon(FontAwesomeIcons.userNinja),radius: 50,),  
                SizedBox(height: 20,),
                Text("Olá, fulano!", style: textStyles.headline5,),
                //quando userController tiver pronto:
                //CircleAvatar(userController.model.foto) ??? (confirmar)
                //Text("Olá, ${userController.model.nome}!")
              ], 
            ),
          ),
              SizedBox(height: 20),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.userCircle),
                title: Text('Minha conta'),
                trailing: FaIcon(FontAwesomeIcons.angleRight),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MinhaConta())
                    );
                },
              ),
              SizedBox(height: 20),
               ListTile(
                leading: FaIcon(FontAwesomeIcons.clock),
                title: Text('Histórico'),
                trailing: FaIcon(FontAwesomeIcons.angleRight),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Historico())
                    );
                },
              )

 
        ],
        )
         
    
    
  }
}
