import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/contact_list.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final Permission _permission = Permission.contacts;
  PermissionStatus _permissionStatus = PermissionStatus.undetermined;
  Iterable<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      _permissionStatus = status;
    });
  }

  _openContacts() async {
    requestPermission(_permission);
    if (_permissionStatus == PermissionStatus.granted) {
      Iterable<Contact> contacts =
      await ContactsService.getContacts(withThumbnails: false);
      this.setState(() {
        _contacts = contacts;
      });
      if (_contacts != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                ContactListPage(
                  contacts: _contacts,
                )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
        ),
        body: Container(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: () {
                          _openContacts();
                        },
                        child: Text("Load Contacts")),
                  ]),
            )));
  }
}
