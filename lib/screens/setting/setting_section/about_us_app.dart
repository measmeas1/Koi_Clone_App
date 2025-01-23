// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers


import 'package:assignment/themes/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AboutUsApp extends StatelessWidget{
  const AboutUsApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = context.watch<ThemeLogic>().mode;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://i.pinimg.com/originals/cf/3a/ac/cf3aaca5f6c865502b1fbce6cb4a7867.jpg',
            height: 350.0,
            width: double.infinity,
            fit: BoxFit.cover,
            // alignment: Alignment.bottomCenter,
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 260.0,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.orange,),
                    onPressed: (){
                      Navigator.of(context).pop();
                    }
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: IntrinsicHeight( // use this instead of Expended
                    child: Container(
                      margin: EdgeInsets.only(top: 4.0),
                      width: double.infinity,
                      //height: double.infinity, use this will lead to bug
                      decoration: BoxDecoration(
                        color: _themeMode == ThemeMode.dark ? Colors.grey.shade900 : Colors.grey.shade200,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(34.0),),
                        boxShadow: [BoxShadow(blurRadius: 2.4, spreadRadius: 1.4, color: Colors.black38)],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _Owner(),
                          _About(),
                          _Photo(),
                          const SizedBox(height: 24.0,),
                          Container(
                            width: double.infinity,
                            height: 94,
                            //color: Colors.blue,
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                'Develop By Group 5',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'siemreap',
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Owner extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = context.watch<ThemeLogic>().mode;
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImgCard(
                  image: NetworkImage("https://assets-global.website-files.com/62719646d2b2c958183d39b7/63b239d16c21e6848c133a49_Brittany-Profile-Image.jpg"),
                  padding: const EdgeInsets.only(left: 10),
                  //onTap: () =>_buildContactDetail(context, 0)
                  onTap: () {} // do nth for now when click on pic
              ),
              Row(
                children: [
                  IconButton(icon: Icon(Icons.favorite), color: Colors.red, onPressed: (){}),
                  IconButton(icon: Icon(Icons.share), color: Colors.brown[600], onPressed: (){}),
                  IconButton(icon: Icon(Icons.chat), color: Colors.blue[600], onPressed: (){})
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 24,),
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'ABOUT US',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[400],
                        letterSpacing: 2.0
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "KOI CAMBODIA\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'k',
                            fontSize: 24,
                            letterSpacing: 3.0,
                            color: Colors.brown
                        )
                    ),
                    TextSpan(
                        text: "CAFFEE",
                        style: TextStyle(
                            fontFamily: 'k',
                            fontSize: 16,
                            color: Colors.amber[800]
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(28.0),
            margin: const EdgeInsets.symmetric(vertical: 28.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              color:  _themeMode == ThemeMode.dark ? Colors.grey.shade800 : Colors.blueGrey.shade50,
            ),
            child: Text(
              'មានស្ថង់ដាអនាម័យ និងផ្តល់ឲ្យអ្នកនូវអាហារឈ្ងុយឆ្ងាញ់រួមជាមួយនិងភេសជ្ជះសំបូរបែប។ ទីកន្លែងសម្រាប់ជួបប្រជុំ និងមានបណ្តាល័យអានសៀវភៅប្រកបដោយផាសុខភាព។',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'siemreap',
                  letterSpacing: 0,
                  color:  _themeMode == ThemeMode.dark ? Colors.grey.shade400 : Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class _About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemList(
          icon: Icons.pin_drop,
          title: 'ទីតាំង',
          txt:  'ផ្ទះលេខ ផ្លូវលេខ៩៥ សង្កាត់បឹងត្របែក ខណ្ឌចំការមន រាជធានីភ្នំពេញ',
        ),
        ItemList(
          icon: Icons.phone,
          title: 'ទូរស័ព្ទ',
          txt: '076 555 5583',
        ),
        ItemList(
          icon: Icons.access_time,
          title: 'ម៉ោងបើក',
          txt: '8:00 ព្រឹក - 8:00 យប់',
        ),
        const SizedBox(height: 24.0,),
        CardItemList(
          title: 'សេវាកម្មក្នុងហាង',
          txt: 'មាននូវភេសជ្ចះគ្រប់ប្រភេទ គ្រប់រស់ជាតិ រួមជាមួយនឹងអាហាររស់ជាតិឆ្ងុយឆ្ងាញ់ ទៅតាមតម្រូវការរបស់លោកអ្នក។',
        ),
        CardItemList(
          title: 'បណ្តាល័យ',
          txt: 'ហាងការហ្វេ​យើងខ្ញុំក៏មានលក់សៀវភៅអាន់គ្រប់ប្រភេទ រួមទាំងមានសៀវភៅអានដោយឥតគិតថ្លៃផងដែរ។',
          widget: null,
        ),
        const SizedBox(height: 14.0,),
        const Divider(indent: 38, endIndent: 38,),
        
      ],
    );
  }
}

class _Photo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0, top: 28.0, bottom: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ផែនទី និងទិត្ធភាពហាង',
                style: TextStyle(fontSize: 16.0),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
  
        const SizedBox(height: 24,),
        Wrap(
          children: [
            ...shopImgDemo
                .asMap()
                .map((index, value) =>
                MapEntry(

                    index,
                    _ImgCard(
                      img: value.img,
                      onTab: () => Navigator.of(context).pushNamed('/imgViewer', arguments: value.img),
                    )
                )
            ).values,
          ],
        )
      ],
    );
  }

}

class _ImgCard extends StatelessWidget{
  final String img;
  final GestureTapCallback? onTab;
  const _ImgCard({required this.img, this.onTab});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(8),
      width: width/2.3,
      height: width/2,
      child: GestureDetector(
        onTap: onTab ?? onTab,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(28.0)),
          child: Image.network(img, fit: BoxFit.cover,),
        ),
      ),
    );
  }
}

// should be seperate, but for now just put in one package

class ItemList extends StatelessWidget{

  final String title, txt;
  final IconData? icon, icon2;
  const ItemList({super.key, this.icon, required this.title, this.icon2, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 24.0, right: 15.0, top: 24.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              icon == null ? const SizedBox() : Icon(icon,  size: 28,),
              Expanded(
                child: Text(
                    "  $title",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      fontFamily: 'preahvihear',
                      fontSize: 18,
                      letterSpacing: 0,
                    )
                ),
              ),
              Icon(icon2 ?? Icons.arrow_drop_down, size: 28,),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 65.0, right: 60.0),
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'siemreap',
            ),
          ),
        ),
      ],
    );
  }
}

class CardItemList extends StatelessWidget{

  final String title, txt;
  final Widget? widget;
  const CardItemList({super.key, required this.title, required this.txt, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        decoration: BoxDecoration(color: Colors.amber[100],
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2.4, offset: const Offset(0.4, 0.4),),],
          borderRadius: BorderRadius.circular(20.0),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 24.0, right: 15.0, top: 24.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(Icons.lens, color: Colors.black, size: 8,),
                  Expanded(
                    child: Text(
                        "  $title",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 0,
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 24),
              child: Text(
                txt,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontFamily: 'siemreap',
                  letterSpacing: 0,
                ),
              ),
            ),
            widget ?? SizedBox(),
          ],
        )
    );
  }
}

class ImgCard extends StatelessWidget {

  final double _width, _height;
  final Color _borderColor;
  final bool _shadow;
  final double _borderSize;
  final EdgeInsets? padding;
  final ImageProvider image;
  final GestureTapCallback? onTap;

  const ImgCard({super.key, required this.image, this.onTap, double width = 70,
    double height = 70, double borderSize  = 2.5, this.padding, bool shadow = true,
    Color color = Colors.white60, bool mini = false})
      : _width = width, _height = height, _borderColor = color, _shadow = shadow, _borderSize = borderSize;

  @override
  Widget build(BuildContext context) {
    // if don't wrap it with Container will error when do horizental scrol
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: _width,
          height: _height,
          margin: padding,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: image, fit: BoxFit.cover),
              border: Border.all(color: _borderColor, width: _borderSize),
              boxShadow: _shadow ? [BoxShadow(blurRadius: 2, color: Colors.black45,)] : null
          ),
        ),
      ),
    );
  }
}

class ShopImgModel {
  final String img;
  final String? title, detail;
  const ShopImgModel({required this.img, this.title, this.detail});
}

List<ShopImgModel> shopImgDemo = [
  ShopImgModel(img: 'https://pix10.agoda.net/hotelImages/311/3111991/3111991_17110620220058796574.jpg?s=1024x768'),
  ShopImgModel(img: 'https://www.comunicaffe.com/wp-content/uploads/2020/05/Caf%C3%A9-Saturnus.jpg'),
  ShopImgModel(img: 'https://th.bing.com/th/id/OIP.1yhNJ__PCDs0wmznZT8pHQHaJ3?rs=1&pid=ImgDetMain'),
  ShopImgModel(img: 'https://th.bing.com/th/id/OIP.wbBXAggfuP0SOwL-tUEsLgHaHa?w=1080&h=1080&rs=1&pid=ImgDetMain'),
];