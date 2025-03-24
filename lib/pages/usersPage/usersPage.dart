import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  TextEditingController queryTextEditingController = TextEditingController();
  bool notVisible = false;
  List<dynamic> users = [];
  int currentPage = 1;
  int totalPages = 1;
  int pageSize = 20;
  ScrollController scrollController = ScrollController();
  String query = "";

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        _loadMoreUsers();
      }
    });
  }

  void _search(String newQuery) {
    if (newQuery.isEmpty) return;
    setState(() {
      query = newQuery;
      currentPage = 1;
      users.clear(); // Réinitialiser les résultats
    });

    var url = "https://api.github.com/search/users?q=$query&per_page=$pageSize&page=$currentPage";
    http.get(Uri.parse(url)).then((response) {
      var responseData = json.decode(response.body);

      setState(() {
        users = responseData['items'] ?? [];
        totalPages = (responseData['total_count'] / pageSize).ceil();
      });
    }).catchError((error) {
      print("Erreur : $error");
    });
  }

  void _loadMoreUsers() {
    if (currentPage >= totalPages) return; // Vérifier si on a atteint la dernière page

    currentPage++;
    var url = "https://api.github.com/search/users?q=$query&per_page=$pageSize&page=$currentPage";
    http.get(Uri.parse(url)).then((response) {
      var responseData = json.decode(response.body);

      setState(() {
        users.addAll(responseData['items'] ?? []);
      });
    }).catchError((error) {
      print("Erreur : $error");
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List ($currentPage/$totalPages)'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: notVisible,
                    controller: queryTextEditingController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            notVisible = !notVisible;
                          });
                        },
                        icon: Icon(notVisible ? Icons.visibility_off : Icons.visibility),
                      ),
                      contentPadding: EdgeInsets.all(8),
                      labelText: "Entrez votre texte",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _search(queryTextEditingController.text);
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            SizedBox(height: 10),

            Expanded(
              child: users.isEmpty
                  ? Center(child: Text("Aucun résultat"))
                  : ListView.builder(
                controller: scrollController,
                itemCount: users.length + 1, // Ajout d'un indicateur de chargement
                itemBuilder: (context, index) {
                  if (index == users.length) {
                    return currentPage < totalPages
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox();
                  }
                  var user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user['avatar_url']),
                    ),
                    title: Text(user['login']),
                    subtitle: Text(user['html_url']),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      print("Utilisateur sélectionné : ${user['login']}");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
