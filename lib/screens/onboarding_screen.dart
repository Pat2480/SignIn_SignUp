//flutter pub add google_fonts
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardingWidget(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                      demo_data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(isActive: index == _pageIndex),
                          )),
                  //   const Spacer(),
                  //   SizedBox(
                  //   height: 60,
                  //   width: 60,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         shape: const CircleBorder(),
                  //         backgroundColor: Colors.pink),
                  //     onPressed: () {
                  //       _pageController.nextPage(
                  //         duration: const Duration(microseconds: 300),
                  //         curve: Curves.ease,
                  //       );
                  //     },
                  //     child: const Icon(
                  //       Icons.arrow_forward,
                  //       color: Colors.white,
                  //       size: 30,
                  //     ),
                  //   ),
                  // ),

                  //   Container(
                  //     height: 12,
                  //     width: 12,
                  //     decoration: const BoxDecoration(
                  //       color: Colors.red,
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(12),
                  //       )
                  //     ),
                  //   )
                  // ],)

                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.pink),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(microseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 16 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.red.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demo_data = [
  OnBoard(
      image: "assets/images/page1.png",
      title: "Find the item you've \nbeen looking for",
      description:
          "Here you'll see rich varities of goods, carefully classified for seamless browsing experience."),
  OnBoard(
      image: "assets/images/page2.png",
      title: "Get those shopping \nbags filled",
      description:
          "Add any item you want to your cart, or sava it on your wishlist."),
  OnBoard(
      image: "assets/images/page3.png",
      title: "Fast and secure \npayment",
      description: "There are many payment option for you ease."),
];

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 280,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
