# The Fun Class
Hack Challenge 2021 IOS repo for "The Fun Class", an app where you can input your interests and receive a list of Cornell classes to take. 

## Link to Backend Repo
https://github.com/jjjxu/AppDevBackend

## Screenshots
![alt text](https://github.coecis.cornell.edu/lls96/The-Fun-Class-IOS/blob/main/homePage.png?)
![alt text](https://github.coecis.cornell.edu/lls96/The-Fun-Class-IOS/blob/main/Interests.png?)
![alt text](https://github.coecis.cornell.edu/lls96/The-Fun-Class-IOS/blob/main/ClassResults.png?)
![alt text](https://github.coecis.cornell.edu/lls96/The-Fun-Class-IOS/blob/main/ClassSpec.png?)

## Short Description of App and Features
The Fun Class is an app that allows students to find classes that they would like to enroll in as their “fun”, and non-major or required course based on their interests, the class’s workload, the class’s difficulty, or by simply browsing historically popular courses across a wide range of disciplines.

The Fun Class allows students to discover courses that they would actually enjoy (that they are enrolling in for fun rather than a requirement) by first taking into account the user’s indicated interests and outputting courses that are related to those interests. Elements of the course such as its workload and difficulty (obtained from CU reviews) are taken into account where only courses with a low overall rating for both are returned so that a user does not accidentally take a “fun” class that ends up being a lot of work or extremely difficult. The user can also filter the classes relevant to their interests by their lowest levels of difficulty, workload, and popularity (overall score). If a student is particularly interested in a course, they can click on it which will guide them to another screen that gives them more information about it. 

## How it Satisfies IOS requirements
All elements are laid out on the screen via a setUpConstraints function that utilizes AutoLayout using SnapKit. We used a <UICollectionView> to render the filter options, and a separate <UITableView> to render the returned courses. We used UINavigationController to navigate between screens via the buttons labeled: Enter App, Submit, and clicking on a tableviewcell. The API we integrated provides meaning to our app in that it gains access to cornell course’s information such as the credits each course allots, and its class name and description. The API also obtained information from CU reviews regarding courses’ difficulty level and workload which were important factors in ensuring that the courses will be enjoyable for users rather than a ton of work or extremely difficult. 
