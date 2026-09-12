import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 35, 95),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 35, 95),
        title: Padding(
          padding: const EdgeInsets.all(100.0),
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        actions: [],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Column(
            children: [
              const Text(
                'Hello Welcome back',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Welcome back please\nsign in again',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          //Pembungkus dari email dan password
          Column(
            children: [
              //Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.email, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), //jarak dari email dan garis
                    Container(width: 300, height: 1, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 30), //Jarak diantara Email dan
              //Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.lock, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Password',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), //jarak dari password dan garis
                    Container(width: 300, height: 1, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 50), //Jarak dari password ke login

          Container(
            alignment: Alignment.center,
            height: 50,
            width: 270,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Divider(color: Colors.white54, thickness: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'or',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Divider(color: Colors.white54, thickness: 1),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Column(
            children: [
              Container(
                height: 45,
                width: 290,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/iconfb.png', width: 30, height: 30),
                    const SizedBox(width: 6),
                    const Text(
                      'Facebook',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Container(
                height: 45,
                width: 290,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/search.png', width: 30, height: 20),
                    const SizedBox(width: 10),
                    const Text(
                      'Google',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'already have an account?',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(width: 5),
                Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
