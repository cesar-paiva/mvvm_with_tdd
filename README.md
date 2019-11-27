# MVVM with TDD
Testing MVVM iOS code usign TDD techniques

<p align="center">
  <img src="https://github.com/cesar-paiva/mvvm_with_tdd/blob/master/loginform_app_screenshot.png?raw=true" height="500">
</p>

### Description

Login form an iOS app based on the Single View Controller project template using TDD techniques. The app will have two view controllers that provide sign up and login screen functionality. This app will be built using the MVVM application architecture.


### Application Architecture

<p align="center">
  <img src="https://github.com/cesar-paiva/mvvm_with_tdd/blob/master/loginform_architecture.png?raw=true" height="500">
</p>

Following is a brief description of the layers and the component classes:
 
 - **Model Layer**: Consists of the LoginModel and SignupModel classes, instances of which are used to store the data entered by the user on the Login and Signup screens respectively. This layer also contains three classes to handle field validation – UserNameValidator, PasswordValidator, and EmailAddressValidator.
 
 - **View Model Layer**: Consists of the LoginViewModel and SignupViewModel classes.
 
 - **View/View Controller Layer**: Consists of the LoginViewController and SignupViewController classes. These classes provide the user interface for the app.

- **Other Controllers Layer**: Consists of the LoginController and SignupController classes that carry out the actual process of login and signup. In this project, these classes are stub implementations. In a real-world scenario, you will write code in these classes to connect to your back-end web services and perform the necessary steps required to log in/sign up.

## Requirements
- Xcode 10.2.1
- iOS 11
- Swift 4.2

## How to use
Just download source code and unzip the downloaded folder and open project in Xcode.

**Using Terminal:**
```
  git clone https://github.com/cesar-paiva/mvvm_with_tdd.git
  ```

#### Screenshots
<table align="center" border="0">

<tr>
<td> <img src="https://github.com/cesar-paiva/world-cup-champions/blob/master/launch-screen.png?raw=true" height="500"> </td>
<td> <img src="https://github.com/cesar-paiva/world-cup-champions/blob/master/home-screen.png?raw=true" height="500"> </td>
<td> <img src="https://github.com/cesar-paiva/world-cup-champions/blob/master/detail-screen.png?raw=true" height="500"> </td>
</tr>

</table>
