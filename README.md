# bliss

The Biss is an e-commerce mobile application and the following features are in the Biss mobile app.
- Add item to cart.
- Filter the items.
- Sharing details with social media.
- Add favourite item.

[![enter image description here][1]][1]

[![enter image description here][2]][2]

[![enter image description here][3]][3]

[![enter image description here][4]][4]

[![enter image description here][5]][5]

[![enter image description here][6]][6]

  [1]: https://res.cloudinary.com/thinksmart-solution/image/upload/v1634716327/food_sugar_amount/66_ci5fuj.png

  [2]: https://res.cloudinary.com/thinksmart-solution/image/upload/v1634716298/food_sugar_amount/Capture_nht1ij.png
  
  [3]: https://res.cloudinary.com/thinksmart-solution/image/upload/v1634716336/food_sugar_amount/22_nrjp6b.png
  
  [4]: https://res.cloudinary.com/thinksmart-solution/image/upload/v1634716331/food_sugar_amount/23_a5ecbl.png
   
  [5]: https://res.cloudinary.com/thinksmart-solution/image/upload/v1634716342/food_sugar_amount/Capture44_dxks4b.png
    
  [6]: https://res.cloudinary.com/thinksmart-solution/image/upload/v1634716347/food_sugar_amount/Capture445_ep5xqi.png

# Deploy and Run The Biss app

Step 1 - Go to the folder where you want to store your project, and clone the project repository:

` ~$ git clone https://github.com/DeshaniRanasinga28/bliss.git `

Step 2 - Lates code is available in develop branch and using the following git command for the switch to the develop branch:

` ~$ git checkout develop `

Step 3 - Open the project folder using IDE (Android studio/VS code) and execute the following command or click flutter pub get in the application's **pubspec.yml** file. It helps to gets all the dependencies listed in the pubspec.yaml file:

`~$ flutter pub get`

Step 4 - Connect the device or create/run the virtual device (emulator):

Step 5 - Run the application:

## Running the application with Android Native code

Open Android folder inside the Bliss Application using the Android Studio:
1. Clean Project
2. Rebuild Project
3. Run

## Running the application with iOS Native code

Open Runner.xcworkspace file inside the Bliss Application's ios folder using the Xcode: 
1. Clean Build Project
2. Build
3. Run

# State management of the app
The  Bliss Application has used the Flutter Provider package for State management. It mainly provides a central point to manage the state and to write front end logic. Also the Provider work on the one provider and multiple subscribers concept. Provider listens to the application changes with NotifyChangeListener it will update all the consumers

# Dependencies
`  cupertino_icons: ^1.0.0 `

` intl: ^0.16.1 `

`  provider: ^4.3.3 `

` http: ^0.12.2 `

` rxdart: ^0.25.0 `

` toast: ^0.1.5 `

` connectivity: ^2.0.2 `

` page_transition: ^1.1.7+6 `

` badges: ^1.1.6 `

`share: ^0.6.5+4 `

# Third party libraries
used Mocky for custom API responses 
[https://designer.mocky.io/]

