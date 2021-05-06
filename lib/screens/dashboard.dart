import 'package:bytebankbd/screens/contacts_list.dart';
import 'package:bytebankbd/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //alinhamento principal eixo vertical
        crossAxisAlignment: CrossAxisAlignment.start,
        //horizontal
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,// mudando posição
            child: Row(
              children: [
                _FeatureItem(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: (){
                   _showContactsList(context);
                  },
                ),
                _FeatureItem(
                  'Transaction Feed',
                  Icons.description, onClick: () => _showTransactionsList(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }

  void _showContactsList(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactsList(),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick; //callback dart

  //_FeatureItem(this.name, this.icon, {@required this.onClick});
  _FeatureItem(
      this.name,
      this.icon, {
        @required this.onClick,
      })  : assert(icon != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          //Precisa do material
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Theme.of(context).primaryColor,
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 32.0,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
