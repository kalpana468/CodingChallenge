# CodingChallenge #NASAAPod apis
- This project is built using xcode 12.x , 
- for apple devices with iOS version 14.x onwards.
- Using this app an user can select a date and hit on search button and it displays a picture modally.

- Uses NSUrlSession 
- Internally it takes the date and  uses NASA public apis to fetch the image and few other details provided by the api on app.
- It works only if the device is connected to internet.

- Supports offline mode
- However, user can mark images as their favourites , which will cache them and can be viewed in offline mode.

- Uses Coredata framework
- The images marked as favourite will be displayed on the first tab - favourites tab.

- Uses Tab bar, Storyboard, Date picker, segue
- If user does not find their desired picture in the list , user can switch to the next tab -> search tab 
select a date from the picker and search for the image of that date.
- User can only view images for current date and prior dates till 16 june 1995.
