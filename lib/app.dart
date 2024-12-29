import 'package:flutter/material.dart';
import 'package:home_screen/ui/bottom_nav_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavScreen(),
    );
  }
}

/*
Each of them applied carefully
------------------------------

family: Akatab font: Regular size: 14 (Continue Watching -> Akatab, SemiBold, 18) (See more -> Roboto, Regular, 14)
family: Akatab font: Regular size: 14 (Trending Movies -> Akatab, SemiBold, 18)
family: Roboto font: Regular size: 14 (Recommended For You -> Akatab, SemiBold, 18)

Hello Rafsan (Roboto, Medium, 20)    Double Love, Curse Of The River, Sunite
Let's (Roboto, Regular, 14)

chips(Aktab, regular, 14)

Aktab SemiBBold
Roboto Medium, Regular

Recommended image (w->99,H->127)
Continue image (w->166,H->98)
Trending (w->99,H->127)

Slider (w -> 343, H -> 165)
 */
