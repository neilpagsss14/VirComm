import 'package:flutter/material.dart';
import 'package:new_app/screens/pages/hospital/specific_widgets/food_container.dart';
import 'package:new_app/screens/pages/hospital/specific_widgets/food_type.dart';
import 'package:new_app/widgets/text.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'jane',
                  child: Container(
                    height: 180,
                    width: 200,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage('assets/images/doctor1.png'),
                            fit: BoxFit.fitHeight)),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  height: 180,
                  width: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text('Dr. Jane:', 16, Colors.black),
                      const SizedBox(
                        height: 5,
                      ),
                      text('"Here are \nyour Diet Plan"', 14, Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: SizedBox(
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: text("TO EAT", 18, Colors.green),
                ),
                const SizedBox(
                  height: 20,
                ),
                foodtype('Fruits', Icons.check_box, Colors.green, Colors.green),
                const SizedBox(
                  height: 10,
                ),
                foodContainer(
                  'banana.png',
                  'Banana',
                  '3-5pcs/week',
                  Colors.green,
                ),
                foodContainer(
                  'apple.png',
                  'Apple',
                  '2-3pcs/week',
                  Colors.green,
                ),
                foodContainer(
                  'grapes.png',
                  'Grapes',
                  '8-12pcs/week',
                  Colors.green,
                ),
                foodContainer(
                  'watermelon.png',
                  'Watermelon',
                  'once/week',
                  Colors.green,
                ),
                foodContainer(
                  'avocado.png',
                  'Avocado',
                  '2pcs/week',
                  Colors.green,
                ),
                const SizedBox(
                  height: 10,
                ),
                foodtype(
                    'Vegetables', Icons.check_box, Colors.blue, Colors.blue),
                const SizedBox(
                  height: 10,
                ),
                foodContainer(
                  'tomatoe.png',
                  'Tomatoes',
                  'twice/week',
                  Colors.blue,
                ),
                foodContainer(
                  'carrots.png',
                  'Carrots',
                  'once/week',
                  Colors.blue,
                ),
                foodContainer(
                  'potatoe.png',
                  'Potatoe',
                  'twice/week',
                  Colors.blue,
                ),
                const SizedBox(
                  height: 10,
                ),
                foodtype('Others', Icons.check_box, Colors.amber, Colors.amber),
                const SizedBox(
                  height: 10,
                ),
                foodContainer(
                  'milk.png',
                  'Milk',
                  'once/day',
                  Colors.amber,
                ),
                foodContainer(
                  'rice.png',
                  'Rice',
                  '2cups/meal',
                  Colors.amber,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: text("TO AVOID", 18, Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      text('Foods/Drinks', 28, Colors.red),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                foodContainer(
                  'proccesedfood.png',
                  'Proccesed\nFoods',
                  '',
                  Colors.red,
                ),
                foodContainer(
                  'cake.png',
                  'Cakes',
                  '',
                  Colors.red,
                ),
                foodContainer(
                  'coffee.png',
                  'Coffee',
                  '',
                  Colors.red,
                ),
                foodContainer(
                  'barbecue.png',
                  'Barbecue',
                  '',
                  Colors.red,
                ),
                foodContainer(
                  'friedfoods.png',
                  'Fried\nFoods',
                  '',
                  Colors.red,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
