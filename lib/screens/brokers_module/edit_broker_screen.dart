
import 'package:flutter/material.dart';

class EditBroker extends StatefulWidget {
  const EditBroker({super.key});

  @override
  State<EditBroker> createState() => _EditBrokerState();
}

class _EditBrokerState extends State<EditBroker> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Edit broker", style: TextStyle(fontSize: 30)),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Broker name',
                    prefixIcon: Icon(Icons.label),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                    prefixIcon: Icon(Icons.language),
                    hintText: 'Comprising of protocol (tcp://, ssl://...)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Port',
                    prefixIcon: Icon(Icons.swap_vert),
                    border: OutlineInputBorder(),
                  ),
                  initialValue: '1883',
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Client ID',
                    prefixIcon: Icon(Icons.perm_identity),
                    border: OutlineInputBorder(),
                  ),
                  initialValue: 'MqttDashboard-4489135',
                  readOnly: true,
                ),
                SizedBox(height: 10),
                Text(
                  'Must be unique. The connection might be unstable otherwise.',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  title: Text("Broker protection"),
                  value: false,
                  onChanged: (newValue) {},
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                ListTile(
                  leading: Icon(Icons.security),
                  title: Text('Use SSL connection'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                CheckboxListTile(
                  title: Text("Do not connect at startup"),
                  subtitle: Text(
                    'If enabled, you will need to manually start the connection from the menu.',
                  ),
                  value: false,
                  onChanged: (newValue) {},
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onItemTapped: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black45,
        onPressed: () {
          _onItemTapped(2);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}


class CustomBottomAppBar extends StatelessWidget {
  final Function(int) onItemTapped;

  CustomBottomAppBar({required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      notchMargin: 10.0,
      child: CustomPaint(
        // painter: CurvePainter(),
        child: Container(
          height: 50.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.question_mark),
                    onPressed: () {},
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