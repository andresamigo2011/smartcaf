import 'package:flutter/cupertino.dart';

class Pet {
  String nombre;
  String animal;
  String raza;
  String color;
  int edad;
  String altura;
  String peso;
  bool active;

  Pet(this.nombre, this.animal, this.raza, this.color, this.edad, this.altura,
      this.peso, this.active);

  setNombre(String nombre) {this.nombre = nombre;}
  setAnimal(String animal) {this.animal = animal;}
  setRaza(String raza) {this.raza = raza;}
  setColor(String color) {this.color = color;}
  setEdad(int edad) {this.edad = edad;}
  setAltura(String altura) {this.altura = altura;}
  setPeso(String peso) {this.peso = peso;}
  setActive(bool active) {this.active = active;}
}