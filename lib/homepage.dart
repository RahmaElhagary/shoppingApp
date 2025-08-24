import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final PageController _pagecontroller = PageController();

  List<Map<String, String>> items = List.generate(6, (index) {
    List<String> names = [
      "MacBook Pro 16",
      "Wireless Headphones",
      "Smart Watch",
      "Designer Backpack",
      "Premium Keyboard",
      "Wireless Mouse",
    ];
    List<String> prices = [
      "\$2,399",
      "\$299",
      "\$399",
      "\$129",
      "\$199",
      "\$79",
    ];
    List<String> images = [
      "https://images.unsplash.com/photo-1675868374786-3edd36dddf04?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8TWFjQm9vayUyMFBybyUyMDE2fGVufDB8fDB8fHww",
      "https://plus.unsplash.com/premium_photo-1679513691474-73102089c117?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8V2lyZWxlc3MlMjBIZWFkcGhvbmVzfGVufDB8fDB8fHww",
      "https://images.unsplash.com/photo-1617043786394-f977fa12eddf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fFNtYXJ0JTIwV2F0Y2h8ZW58MHx8MHx8fDA%3D",
      "https://media.istockphoto.com/id/2091508264/photo/black-backpack-front-and-back-view-isolated-on-white-product-photo-studio.jpg?s=612x612&w=0&k=20&c=l0ZqKWcJ7UrpTA_nKrtCn73EpneuxWnLYRfolk0YGAU=",
      "https://images.unsplash.com/photo-1613332752222-129f41f9e5db?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fFByZW1pdW0lMjBLZXlib2FyZHxlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1707592691247-5c3a1c7ba0e3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8V2lyZWxlc3MlMjBNb3VzZXxlbnwwfHwwfHx8MA%3D%3D",
    ];

    return {
      "name": names[index],
      "price": prices[index],
      "image": images[index],
    };
  });

  List<Map<String, String>> offers = List.generate(5, (index) {
    List<String> titles = [
      "50% Off Electronics",
      "Free Shipping Weekend",
      "Buy 2 Get 1 Free",
      "Student Discount",
      "Bundle Deals",
    ];
    List<String> contents = [
      "Limited time offer on all tech gadgets",
      "No delivery charges on orders above \$50",
      "On selected accessories and peripherals",
      "Extra 20% off with valid student ID",
      "Save more when you buy complete setups",
    ];
    List<String> bottons = [
      "50% OFF",
      "FREE SHIP",
      "B2G1",
      "20% OFF",
      "BUNDLE",
    ];
    return {
      "title": titles[index],
      "content": contents[index],
      "button": bottons[index],
    };
  });

  @override
  void initState() {
    super.initState();
    _pagecontroller.addListener(() {
      int next = _pagecontroller.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF667EEA),
        title: Text(
          "Our Products",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Featured Products",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: PageView(
                  controller: _pagecontroller,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1559163499-413811fb2344?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjV8fExhcHRvcHxlbnwwfHwwfHx8MA%3D%3D",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Premium Laptop Collection",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://plus.unsplash.com/premium_photo-1661775522763-451d7783b453?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjF8fGJ1c2luZXNzfGVufDB8fDB8fHww",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Professional Workspace",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://media.istockphoto.com/id/1127237793/photo/lens-flare-space-light-abstract-black-background.jpg?s=612x612&w=0&k=20&c=yDb7h_eRSV_i5H5cI5RYHPPzIrpCOKqzVSXMENCF2iI=",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ambient Lighting",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (currentPage == index
                          ? Color(0xFF667EEA)
                          : Colors.grey.shade300),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Shop Our Collection",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              GridView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  items[index]["image"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Column(
                                        children: [
                                          Text(
                                            "Item added to the cart",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(items[index]["name"]!),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Color(0xFF667EEA),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 13),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              items[index]["name"]!,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                            left: 13,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              items[index]["price"]!,
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF667EEA),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Hot Offers 🔥",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              ListView.separated(
                separatorBuilder: (context, index){
                  return const SizedBox(height: 10,);
                },
                shrinkWrap: true,                 
                physics: NeverScrollableScrollPhysics(),
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffD6D3D1)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text(offers[index]["title"]!,style: TextStyle(fontWeight: FontWeight.bold),), Text(offers[index]["content"]!,overflow:TextOverflow.ellipsis ,)],
                              ),
                            ),
                          ),
                          const SizedBox(width: 70,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF667EEA),
                              border: Border.all(color: Color(0xff62748E)),
                            ),
                            width: 80,
                            height: 30,
                            child: Center(child: Text(offers[index]["button"]!)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
