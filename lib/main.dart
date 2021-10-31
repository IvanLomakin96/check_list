
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() 
{
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget
  {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
      return MaterialApp(
        title: 'Flutter',
        theme: ThemeData
        (
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),

      );
    }
  }

  class MyHomePage extends StatefulWidget 
  {
    const MyHomePage({Key? key}) : super(key: key);
    
    @override
    State<MyHomePage> createState() => MyHomePageState();
  }

  class MyHomePageState extends State<MyHomePage> 
  {
    bool checked = false;
    
    @override
    Widget build(BuildContext context) {

      autoSize(context);
      
      return Scaffold
      (
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton
            (
              onPressed: (){}, 
              icon: const Icon(Icons.arrow_back, color: Colors.black,)
            ),
          title: const Text
          (
            "Заполнение чек-лист ",
            style: TextStyle(color: Colors.black,)
          ),
          actions: 
          [
           
           PopupMenuButton
            (
              icon: const Icon(Icons.more_vert, color: Colors.black,) ,
             itemBuilder: (context) =>
             [
               const PopupMenuItem
               (
                 child: Text("какой-то функционал"),
                 value: 1,
               ),

               const PopupMenuItem
               (
                 child: Text("Ещё больше какого-то функционала"),
                 value: 2,
               ),

               const PopupMenuItem
               (
                 child: BackButton(color: Colors.black,),
               )
               
               
             ]
            )
             
           
          ],
          iconTheme: const IconThemeData(color: Colors.red),
        ),
        
        body: ListView
        (
          children: 
          [
            Container
              (
                padding: const EdgeInsets.all(14),
                child: const Text
                  (
                    'MM | Камышин | 11 Квартал - 11-й кв-лб дом №4, корпус 58', 
                    style: TextStyle(color: Colors.black45, fontSize: 13),
                  ),
                color: Colors.grey.withOpacity(0.2),
              ),

              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column
                (
                  children: 
                    const 
                    [
                      Text("ОТКРЫТ: 01.07.2021 / ГРУППА: Чек-листы ГМ", style: TextStyle(color: Colors.black45, fontSize: 10, fontWeight: FontWeight.bold)),
                      Text("Чек-лист директора ГМ", style: TextStyle(color: Colors.black, fontSize: 22)),
                      Text("8 БЛОКОВ | 41 ВОПРОСОВ", style: TextStyle(color: Colors.black45, fontSize: 11, fontWeight: FontWeight.bold))
                    ],

                    crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),

              
              ListTile
                (
                  tileColor: Colors.grey.withOpacity(0.2),
                  title: RichText
                    (
                      textAlign: TextAlign.start,
                      text: const TextSpan
                        (
                          text: "Блок 1. Вход в торговый объект", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          children:  <TextSpan>
                            [
                              TextSpan(text: " *", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                        ),
                                    
                    ),

                  subtitle: const Padding(
                  padding: EdgeInsets.fromLTRB(1, 14, 14, 1),
                  child:  Text
                      (
                        "0,00   Заданий: 0     Да: 0 Нет: 0 Без ответа: 2", 
                        style: TextStyle(color: Colors.black, fontSize: 14,),
                      ),
                  ),

                  trailing: checked ? 
                  const Icon(Icons.keyboard_arrow_up, color: Colors.black) :
                  const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          
                  onTap: (){setState(() {checked = !checked;});},
                ),

               checked ? _buildDropDown() : const SizedBox(),
         ]
        ),

        
        
        floatingActionButton: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red,),
            borderRadius: BorderRadius.circular(25) 
            ) ,
          child: FloatingActionButton.extended
            (
              
              onPressed: ()=>exit(0), label: 
                const Text("ЗАВЕРШИТЬ", style: TextStyle(color: Colors.red,)), 
                backgroundColor: Colors.white, 
                foregroundColor: Colors.red ,
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        
      );
    }
}

Widget _buildDropDown() 
{
  return Column
  (
    children: 
    [
      ListTile
      (
        trailing: IconButton( onPressed: (){}, icon: const Icon(Icons.perm_device_information), ),
        title: RichText
                    (
                      textAlign: TextAlign.start,
                      text: const TextSpan
                        (
                          text: "1. Чистая прилегающая территория", style: TextStyle(color: Colors.black, fontSize: 16, ),
                          children:  <TextSpan>
                            [
                              TextSpan(text: "*", style: TextStyle(color: Colors.red, fontSize: 16, )),
                            ],
                        ),
                   ),

        subtitle: const Padding(
                  padding: EdgeInsets.fromLTRB(1, 0, 14, 1),
                  child:  Text
                      (
                        "Тип вопроса: Чистота, порядок и сан. режим", 
                        style: TextStyle(color: Colors.black45, fontSize: 12,),
                      ),
                  ),

      ),

    Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 20, 0),
      child: Row
      (
        children: 
        [
          ElevatedButton(
            onPressed: (){},
            child: const Text("Да"),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor:  MaterialStateProperty.all(Colors.black),
            minimumSize:  MaterialStateProperty.all(const Size(160, 35)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: Colors.black)
              )
            ),
            
            ),
          ),

          const SizedBox(width: 20,),
          
          ElevatedButton(
            onPressed: (){},
            child: const Text("Нет"),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor:  MaterialStateProperty.all(Colors.black),
            minimumSize:  MaterialStateProperty.all(const Size(160, 35)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: Colors.black)
              )
            ),
            
            ),
          ),
            
        ],
      ),

      
    ),

    
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: TextButton(onPressed:(){}, child: const Text('CОЗДАТЬ ЗАДАНИЕ', style: TextStyle(color: Colors.black45),),),
      ),

      const Divider(height: 20, color: Colors.black, thickness: 2,),

      ListTile
      (
        trailing: IconButton( onPressed: (){}, icon: const Icon(Icons.perm_device_information), ),
        title: RichText
                    (
                      textAlign: TextAlign.start,
                      text: const TextSpan
                        (
                          text: "2. Чистая входная зона, исправное оборудование", style: TextStyle(color: Colors.black, fontSize: 16, ),
                          children:  <TextSpan>
                            [
                              TextSpan(text: "*", style: TextStyle(color: Colors.red, fontSize: 16, )),
                            ],
                        ),
                   ),

        subtitle: const Padding(
                  padding: EdgeInsets.fromLTRB(1, 0, 14, 1),
                  child:  Text
                      (
                        "Тип вопроса: Чистота, порядок и сан. режим", 
                        style: TextStyle(color: Colors.black45, fontSize: 12,),
                      ),
                  ),

      ),

    Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 20, 0),
      child: Row
      (
        children: 
        [
          ElevatedButton(
            onPressed: (){},
            child: const Text("Да"),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor:  MaterialStateProperty.all(Colors.black),
            minimumSize:  MaterialStateProperty.all(const Size(160, 35)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: Colors.black)
              )
            ),
            
            ),
          ),

          const SizedBox(width: 20,),
          
          ElevatedButton(
            onPressed: (){},
            child: const Text("Нет"),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor:  MaterialStateProperty.all(Colors.black),
            minimumSize:  MaterialStateProperty.all(const Size(160, 35)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: Colors.black)
              )
            ),
            
            ),
          ),
            
        ],
      ),

      
    ),

    
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: TextButton(onPressed:(){}, child: const Text('CОЗДАТЬ ЗАДАНИЕ', style: TextStyle(color: Colors.black45),),),
      ),

      const Divider(height: 20, color: Colors.black, thickness: 2,),

      ListTile
      (
        trailing: IconButton( onPressed: (){}, icon: const Icon(Icons.perm_device_information), ),
        title: RichText
                    (
                      textAlign: TextAlign.start,
                      text: const TextSpan
                        (
                          text: "3. Чистые урны", style: TextStyle(color: Colors.black, fontSize: 16, ),
                          children:  <TextSpan>
                            [
                              TextSpan(text: "*", style: TextStyle(color: Colors.red, fontSize: 16, )),
                            ],
                        ),
                   ),

        subtitle: const Padding(
                  padding: EdgeInsets.fromLTRB(1, 0, 14, 1),
                  child:  Text
                      (
                        "Тип вопроса: Чистота, порядок и сан. режим", 
                        style: TextStyle(color: Colors.black45, fontSize: 12,),
                      ),
                  ),

      ),

    Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 20, 0),
      child: Row
      (
        children: 
        [
          ElevatedButton(
            onPressed: (){},
            child: const Text("Да"),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor:  MaterialStateProperty.all(Colors.black),
            minimumSize:  MaterialStateProperty.all(const Size(160, 35)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: Colors.black)
              )
            ),
            
            ),
          ),

          const SizedBox(width: 20,),
          
          ElevatedButton(
            onPressed: (){},
            child: const Text("Нет"),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor:  MaterialStateProperty.all(Colors.black),
            minimumSize:  MaterialStateProperty.all(const Size(160, 35)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: Colors.black)
              )
            ),
            
            ),
          ),
            
        ],
      ),

      
    ),

    
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: TextButton(onPressed:(){}, child: const Text('CОЗДАТЬ ЗАДАНИЕ', style: TextStyle(color: Colors.black45),),),
      ),

      const Divider(height: 20, color: Colors.black, thickness: 2,)


    ],
  );

  
}

autoSize(BuildContext context) {
 var WidhtSize = MediaQuery.of(context).size.width;
 var HeightSize = MediaQuery.of(context).size.height;
}



