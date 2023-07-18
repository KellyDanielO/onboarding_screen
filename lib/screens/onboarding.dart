import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Widget> slides = [
    const SlideOne(),
    const SlideTwo(),
    const SlideThree(),
  ];
  int currentIndex = 0;
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: PageView.builder(
                controller: controller,
                itemCount: slides.length,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return slides[index].animate().scaleXY();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: currentIndex == index ? 30 : 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: currentIndex == index
                        ? AppColors.primaryColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height * .1,
              child: currentIndex != 2
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () => controller.jumpToPage(2),
                          child: const Text(
                            "Skip",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 18),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease),
                          child: Container(
                            alignment: Alignment.center,
                            width: width * .4,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ).animate().fadeIn()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: width * .8,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ).animate().fadeIn(),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideOne extends StatelessWidget {
  const SlideOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svgs/undraw_shared_workspace_re_3gsu.svg"),
          const SizedBox(height: 20),
          const Text(
            "Shared Workspace",
            style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontFamily: 'Aclonica'),
          ),
          const SizedBox(height: 20),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque dignissimos est quaerat tenetur maiores debitis!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SlideTwo extends StatelessWidget {
  const SlideTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svgs/undraw_working_re_ddwy.svg"),
          const SizedBox(height: 20),
          const Text(
            "Work with others",
            style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontFamily: 'Aclonica'),
          ),
          const SizedBox(height: 20),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque dignissimos est quaerat tenetur maiores debitis!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SlideThree extends StatelessWidget {
  const SlideThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svgs/undraw_working_remotely_re_6b3a.svg"),
          const SizedBox(height: 20),
          const Text(
            "Work Remotely",
            style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontFamily: 'Aclonica'),
          ),
          const SizedBox(height: 20),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque dignissimos est quaerat tenetur maiores debitis!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
