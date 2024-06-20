# Prixity Ecommerce App
This project developed in Flutter as an assement project for Prixity Soft.

## How to setup project
- Clone the repository into your system
- Make sure you the compitable flutter version for this project. I am using FVM and this app is developed in flutter 3.19.5
- I have added the firebase configuration json and plist file in .gitignor so the project will not directly work on your system.
- Create a firebase project and create a config folder
    - create 2 folders Android and iOS
    - in each of the above folder, add three folder for dev, stg, and prod
    and those fieebase files here in these folders.
    - run the command flutter pub run flutter_flavorizr to configure the internal directories(Android & iOS).
- If you are using VS code, just add the configurations in launch.json file.
/* 
    {
    "version": "0.2.0",
    "configurations": [
        {
            "name": "main_dev",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_dev.dart",
            "args": [
                "--flavor",
                "dev"
            ],
        },
        {
            "name": "main_stg",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_stg.dart",
            "args": [
                "--flavor",
                "stg"
            ],
        },
        {
            "name": "main_prod",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_prod.dart",
            "args": [
                "--flavor",
                "prod"
            ],
        }
    ]
}

/*

- you can also run it from the command and provide appropriate flavour. Command: flutter run --release -t lib/main_prod.dart --flavor prod
- When the firebase get configured, just add dummy data by uncomment 2 functions in the initial_bindings file. One will add images to firebase storage and other will add dummy documents in that firestore database and you have the data now. 
- You're good to go now.

## Assumptions I made during development:
- All the screen which has listing or scrollable, the appbar will be sticky, in this case, the user have the necessary CTAs in front of him/her e.g: back button or cart icon
- There were no loading, empty, and error state provided in the design however I have developed it, it may not look good in the eye of a designer but is necessary to include.
- There will be atleast one active filter in the filters which is price range. I think it make sense to have tihs filter in every call.


## Challenges I have faced and how I overcomed it
- Biggest challege was time constraint, because we were have a religious festival called EID and it was in this 7 days time period. so I just had 2-3 days to complete it.
- Technical challenge was the filter because for each combination, it is necessary to have an active index for that in firestore.
- Make componenets completely independent was a bit time taking, we need to make sure we are inject things not getting inside a component.
- Make use of Clean architecture, this architecture is time consuming but make thing easy for testing when needed.


## Additional features or improvements I added
- Falvours, this is very necessary to have in your production grade app. This allow you to develop and test app easily. Also, databases will be seperate including other service like push notifications, deep links etc so it will not affect the production setup.
- Localisation, is also very important that I have added in the project. If you're planning to launch your app in more than one country, you might need it.

## Bonus (Optional but a plus)
I believe APP LOCALISTIONS and FLAVOURS is a plus to this project.





flutter build apk -t lib/main_prod.dart --flavor prod