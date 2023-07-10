import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto33/Menus/index.dart';
import 'package:flutter/material.dart';

import '../MenuProductos/CatalogoProductos.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameControllerI = TextEditingController();
  final TextEditingController _passwordControllerI = TextEditingController();

  bool isLoginVisible = true;
  bool isRegistrationVisible = false;

  void toggleLoginRegistration() {
    setState(() {
      isLoginVisible = !isLoginVisible;
      isRegistrationVisible = !isRegistrationVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/logoAll.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: toggleLoginRegistration,
                          child: Text(
                            "Iniciar Sesión",
                            style: TextStyle(
                              color: isLoginVisible ? Colors.blue : Colors.black,
                              fontSize: 20,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        GestureDetector(
                          onTap: toggleLoginRegistration,
                          child: Text(
                            "Registrarse",
                            style: TextStyle(
                              color: isRegistrationVisible ? Colors.blue : Colors.black,
                              fontSize: 20,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // --------------------- VENTANA DE REGISTRO--------
                Visibility(
                  visible: isRegistrationVisible,
                  child: Column(
                    children: [
                      Text(
                        "REGISTRESE",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 35),
                      //---------CAJA DE TEXTO NOMBRE USUARIO-------
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Nombre de Usuario',
                          errorStyle: TextStyle(fontSize: 15),
                        ),
                        style: TextStyle(
                          color: Color(0xFF131212),
                          fontSize: 18,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese un nombre de usuario';
                          }
                          return null;
                        },
                      ),

                      //---------TERMINO DE CAJA DE TEXTO MONBRE USUARIO


                      SizedBox(height: 20),
                      TextFormField(
                        controller: _correoController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Correo Electronico',
                          errorStyle: TextStyle(fontSize: 15),
                        ),
                        style: TextStyle(
                          color: Color(0xFF131212),
                          fontSize: 18,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese su correo electronico';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20),
                      // -----------CAJA DE TEXTO CONTRASEÑA
                      TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Contraseña',
                            errorStyle: TextStyle(fontSize: 15), // Tamaño de letra para el mensaje de error
                          ),

                          style: TextStyle(
                            color: Color(0xFF131212),
                            fontSize: 18,
                          ),
                            obscureText: true, // Mostrar el texto de manera oculta

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingrese una contraseña';
                            }
                            if (!RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$').hasMatch(value)) {
                              return 'La contraseña debe contener al menos:\n * Una Letra mayúscula. \n* Un número \n *Tener 6 caracteres como minimo';
                            }
                            return null;
                          },
                      ),

                      SizedBox(height: 30),
                      //---------------INICIO DEL BOTON --
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                              onPressed: () {

                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => VentaCatalogo(),));
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Modificar el color de fondo del botón
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.person),
                                  Text(" Registar",
                                    style: TextStyle(
                                        fontSize: 25
                                    ),
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // ----------------VENTANA INiCIO SESION
                Visibility(
                  visible: isLoginVisible,
                  child: Column(
                    children: [
                      Text(
                        "INICIO SESIÓN",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: 30),
                      TextFormField(
                        controller: _usernameControllerI,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Nombre de Usuario',
                          errorStyle: TextStyle(fontSize: 15), // Tamaño de letra para el mensaje de error

                        ),
                        style: TextStyle(
                          color: Color(0xFF131212),
                          fontSize: 18,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese un nombre de usuario';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        controller: _passwordControllerI,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña',
                          errorStyle: TextStyle(fontSize: 15), // Tamaño de letra para el mensaje de error

                        ),
                        style: TextStyle(
                          color: Color(0xFF131212),
                          fontSize: 18,
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese una contraseña';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: _usernameControllerI.text,
                                    password: _passwordControllerI.text)
                                    .then((value) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => VentaCatalogo()));
                                }).onError((error, stackTrace) {
                                  print("Error ${error.toString()}");
                                });

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Modificar el color de fondo del botón
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.person),
                                  Text(" Iniciar Sesión",
                                    style: TextStyle(
                                        fontSize: 25
                                    ),
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
