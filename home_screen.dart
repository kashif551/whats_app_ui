import 'package:flutter/material.dart';
import 'package:whats_app_ui/chat.dart';
import 'package:whats_app_ui/repositry/apicall.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}


class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    ApiCall().getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child:  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:const Text('WhatsApp'),
        bottom:const TabBar(
          tabs: [
            Tab(
              child: Icon(Icons.camera_alt),
            ),
             Tab(
              child:  Text('Chats'),
            ),
             Tab(
              child:  Text('Status'),
            ),
             Tab(
              child: Text('Calls'),
            ),           
          ]),
          actions: [
          const  Icon(Icons.search),
           const  SizedBox(width: 10,),
              
              PopupMenuButton(
                icon:const Icon(Icons.more_horiz_outlined),
                itemBuilder: (context,) => [
                const  PopupMenuItem(
                    value: '1',
                    child: Text('New Group')
                    ),
                   const  PopupMenuItem(
                    value: '2',
                    child: Text('Setting')
                    ),
                  const  PopupMenuItem(
                    value: '3',
                    child: Text('Logout')
                    ),
                ]
                ),
           
            const  SizedBox(width: 10,)
          ]    
      ),
      body: TabBarView(
        children: [
         const Text('camra'),
          ChatScreen(),  
          ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index){

              if (index == 0) {
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const  Text('New Updates'),
                      ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.greenAccent,
                            width: 2,
                          )
                        ),
                        child:const CircleAvatar(
                          backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ),
                      ),
                      title:const Text('John wick'),
                      subtitle:const Text('where is my dog?'),
                      trailing:const Text('6:36 PM'),
                                     ),
                    ],
                  ),
                );
              }
              else{
                 return  ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.greenAccent,
                      width: 2,
                    )
                  ),
                  child:const CircleAvatar(
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                ),
                title:const Text('John wick'),
                subtitle:const Text('where is my dog?'),
                trailing:const Text('6:36 PM'),
               );
              }
               
            }
            ),
          ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index){
               return ListTile(
                leading:const CircleAvatar(
                  backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
                title:const Text('John wick'),
                subtitle: Text(index /2 == 0 ?'You Missed Audio Call' : "You Missed Video Call Time is 12:30 AM"),
                trailing: Icon(index /2 == 0 ? Icons.phone : Icons.video_call),
               );
            }),
        ]),
    ),
    );
  }
}