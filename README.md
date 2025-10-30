# fitted_fractionally_app

FittedBox vs. FractionallySizedBox Demo

A simple, interactive Flutter application demonstrating two powerful layout widgets essential for responsive design.

 Widget Description

This project showcases how FittedBox manages content scaling to prevent overflow, and how FractionallySizedBox handles responsive container sizing using fractions (percentages) of the parent space.

 Run Instructions

Clone the Repository:

git clone [https://github.com/your-username/fitted_fractionally_app.git](https://github.com/your-username/fitted_fractionally_app.git)
cd fitted_fractionally_app


Run the App:

flutter run


Use the hamburger menu (top-left) to switch between the two demos. Use the sliders in each demo to see the scaling and relative sizing happen in real-time.

✨ Demonstrated Properties (The Required Three Attributes)

The following three attributes were selected and demonstrated during the in-class presentation:

FittedBox.fit

Description: Determines the scaling algorithm used to make the child fit the box (e.g., BoxFit.contain vs. BoxFit.cover). This controls whether the content is fully visible or if it completely fills the space.

FittedBox.alignment

Description: Specifies the position of the scaled child within the parent container if the child does not perfectly fill the space. Used to align the scaled content (e.g., Alignment. center, Alignment.topLeft).

FractionallySizedBox.widthFactor

Description: A double value between 0.0 and 1.0 that sets the child's width as a fraction (percentage) of the parent's available width. This is demonstrated interactively with the slider.

