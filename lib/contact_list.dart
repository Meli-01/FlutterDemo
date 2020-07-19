import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatefulWidget {
  final Iterable<Contact> contacts;

  const ContactListPage({Key key, @required this.contacts}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  Widget _listView(BuildContext context) {
    var c = widget.contacts;
    if (c != null) {
      return ListView.builder(
          itemCount: c.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(c.elementAt(index).displayName),
            );
          });
    } else {
      return Text("No items found.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts List"),
      ),
      body: _listView(context),
    );
  }
}
