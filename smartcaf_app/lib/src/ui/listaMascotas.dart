import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_pet_app/src/bloc/petHandler.dart';

class listaMascotas extends StatefulWidget {
  listaMascotas({Key key,this.title}): super(key: key);
  final String title;
  @override
  PageListMascotas createState() => new PageListMascotas();
}

class PageListMascotas extends State<listaMascotas> {
  List data;
  BusinessLogicComponent handler;

  Future<void> initState() async {
    data = await handler.recibir();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Mascotas"),centerTitle: true,),
        body: Container(

          child: new ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, i){
                if(data == null){
                  return new CircularProgressIndicator();
                }
                else
                  return new InkWell(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Stack(
                              children: <Widget>[
                                Center(
                                    child: Image.network("https://static9.depositphotos.com/1000792/1134/v/950/depositphotos_11348824-stock-illustration-cat-and-dog.jpg",
                                        width: 70,height: 70)
                                ),
                              ]
                          ),
                          //   Text(data[i]['animal'], style: TextStyle(fontSize: 20,),textAlign: TextAlign.justify,),
                          Align(
                            alignment: Alignment.centerRight,
                            child:Text(data[i]['animal'] ),
                          ),
                          Text("Nombre: "+data[i]['nombre'],
                            style: TextStyle(fontSize: 20,),textAlign: TextAlign.justify,),
                          //   Text(data[i]['edad'].toString(), style: TextStyle(fontSize: 20,),textAlign: TextAlign.justify,),
                          Text("Raza: "+data[i]['raza'], style: TextStyle(fontSize: 20,),textAlign: TextAlign.justify,),
                          //   Text(data[i]['peso'], style: TextStyle(fontSize: 20,),textAlign: TextAlign.justify,),
                          //   Text(data[i]['color'], style: TextStyle(fontSize: 20,),textAlign: TextAlign.justify,),
                          //  Text(data[i]['altura'], style: TextStyle(fontSize: 20,),textAlign: TextAlign.justify,),
                        ],
                      ),
                    ),
                    onTap: (){
                      print("Proximamente el detalle de tu mascota! :V");
                      /*Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context)=> new registroMascotas())
                      );*/
                    },
                  );
              }
          ),
        )
    );
  }
}