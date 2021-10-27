import 'package:flutter/material.dart';
import 'package:my_project/widget/appdrawer.dart';
class FilterScreen extends StatefulWidget {
  static const routscreen="/FilterSCreen";
  final Function _savefilter;
  final Map<String,bool>filter;

  const FilterScreen( this._savefilter, this.filter) ;

  @override

  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isnew =false;
  var _isuse= false ;
  var _issyp=false;
  @override
  initState(){
    super.initState();
    _isnew=widget.filter['isnew'];
    _isuse=widget.filter['isuse'];
    _issyp=widget.filter['issyp'];

  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.save),
              onPressed:
              (){
          final  Map<String,bool>_filter={
                "isnew":_isnew ,
               "isuse":_isuse ,
               "issyp":_issyp ,
                  };
                widget._savefilter(_filter);
              }
             )
        ],
        backgroundColor: Colors.orangeAccent,
        title: Center(child: Text("FilterScreen")),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(child:
          ListView(
            children: [
              buildSwitchListTile(
                "the Product new",
                "on click for view the product new only",
                _isnew,
                      (newvalue){
                        print(newvalue);
                    setState(() {
                      _isnew=newvalue;
                    });
                  }
              ),
              buildSwitchListTile(
                  "the Product use",
                  "on click for view the product use only",
                  _isuse,
                      (newvalue){
                        print(newvalue);
                    setState(() {
                      _isuse=newvalue;
                    });
                  }
              ),
              buildSwitchListTile(
                  "the Product syp",
                  "on click for view the product syp only",
                  _issyp,
                      (newvalue){
                    print(newvalue);
                    setState(() {
                      _issyp=newvalue;
                    });
                  }
              ),
            ],
          ),)
        ],
      ),
    );
  }
  SwitchListTile buildSwitchListTile(String title,String subtitle,var current,Function swi) {
    return SwitchListTile(
                  activeColor: Colors.orangeAccent,
                title: Text(title),
                subtitle: Text(subtitle),
                value: current, onChanged: swi,

            );
  }
}
