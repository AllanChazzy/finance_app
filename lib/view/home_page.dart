// ignore_for_file: prefer_const_constructors

import 'package:finance_app/view/login_page.dart';
import 'package:finance_app/view/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Benance',
          style: TextStyle(fontFamily: 'Lexend'),
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MenuPage()));
            },
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.more_vert_outlined,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.login_outlined),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Boas Vindas",
                  style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                _subtitle("Dashboard"),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Card.outlined(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34),
                    ),
                    color: Colors.lightGreenAccent,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: const Text(
                            "Essenciais",
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          //Gráfico01
                          padding: const EdgeInsets.all(16.0),
                          child: CircularPercentIndicator(
                            radius: 64,
                            lineWidth: 24,
                            percent: 0.72,
                            center: const Text(
                              "72%",
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            progressColor: Colors.black,
                            animation: true,
                            animationDuration: 1200,
                            backgroundColor: Colors.lightGreenAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Card.outlined(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34),
                    ),
                    color: Colors.amberAccent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: const Text(
                            "Fixas",
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularPercentIndicator(
                            radius: 64,
                            lineWidth: 24,
                            percent: 0.55,
                            center: const Text(
                              "55%",
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            progressColor: Colors.black,
                            animation: true,
                            animationDuration: 1200,
                            backgroundColor: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _subtitle("Últimos lançamentos"),
          ),
          Column(
            //cards
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.red[100],
                elevation: 0,
                child: ListTile(
                  title: Text(
                    "Expense",
                    style: TextStyle(fontFamily: 'Lexend'),
                  ),
                  subtitle: Text("R\$ -3.000,00",
                      style: TextStyle(fontFamily: 'Lexend')),
                  leading: const Icon(Icons.attach_money_rounded),
                  trailing: const Icon(
                    Icons.more_horiz_outlined,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.lightBlue[100],
                elevation: 0,
                child: ListTile(
                  title: Text(
                    "Receipt",
                    style: TextStyle(fontFamily: 'Lexend'),
                  ),
                  subtitle: Text("R\$ 3.000,00",
                      style: TextStyle(fontFamily: 'Lexend')),
                  leading: const Icon(Icons.attach_money_rounded),
                  trailing: const Icon(
                    Icons.more_horiz_outlined,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.lightGreenAccent[100],
                elevation: 0,
                child: ListTile(
                  title: Text(
                    "Receipt",
                    style: TextStyle(fontFamily: 'Lexend'),
                  ),
                  subtitle: Text("R\$ 3.000,00",
                      style: TextStyle(fontFamily: 'Lexend')),
                  leading: const Icon(Icons.attach_money_rounded),
                  trailing: const Icon(
                    Icons.more_horiz_outlined,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 32,
        unselectedLabelStyle: TextStyle(fontFamily: 'Lexend'),
        selectedLabelStyle: TextStyle(fontFamily: 'Lexend'),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.label_outline_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_backup_restore),
            label: 'Configs',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent[400],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _subtitle(String text) {
    return Text(text,
        style: const TextStyle(
          fontFamily: 'Lexend',
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Colors.grey,
        ));
  }
}
