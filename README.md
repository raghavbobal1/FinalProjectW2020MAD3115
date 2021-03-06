# FinalProjectW2020MAD3115 

<p align="center" ><img src="https://i93.servimg.com/u/f93/18/45/29/87/logo11.png" alt="projectlogo" style="float: center; margin-right: 10px;"/></p>

## PROJECT CONTRIBUTORS

Abhishek Santhosh Jaya <br>
Prakash Rana <br>
Raghav Bobal <br>

## PROJECT DESCRIPTION
Our project is a vehicle renting system which contains a detailed list of customers, drivers, owners and their vehicles. Customers are allowed to rent vehicles with or without a driver. The total is calculated depending on the type of vehicle rented and the number of days for which it was rented.

## PROJECT STRUCTURE
<img src="https://i93.servimg.com/u/f93/18/45/29/87/struct10.jpg" alt="Class hierarchy" style="float: left; margin-right: 10px;"/>

We have used the following packages and classes to implement the above given structure:<br>

### *View Controllers Group* <br>
* **LoginViewController**: VC that allows a customer to login with his credentials
* **SignUpViewController**: VC containing new customer addition
* **DriverViewController**: VC containing driver information
* **CustomerViewController**: VC containing  customer information
* **OwnerViewController**: VC containing owner information
* **PersonDetaiLViewController**: VC containing detailed information about a specific type of user

### *Person Group*<br>
* **Person Class**: Abstract class containing attributes to be inherited by Customer, Driver and Owner Classes
* **Customer Class**: Holds details of customer as well as the vehicles they have rented
* **Driver Class**: Holds information about the drivers that are available
* **Owner Class**: Holds information about owners and the vehicles they own
* **Gender Class**: Enum class to hold gender (Male, Female, Other)
* **Contact Class**: Stores all contact information about a person
* **Address Class**: Class containing address information used in MainRunner

### *Vehicles Group*<br>
* **Vehicle Class**: Abstract class containing attributes to be inherited by Bus, Car, MotorCycle
* **Car Class**: Contains attributes inherited from Vehicle as well as carColor and carType
* **Bus Class**: Contains attributes inherited from Vehicle as well as busType, wifi and accessibility services
* **MotorCycle Class**: Contains attributes inherited from Vehicle as well as mileage and topSpeed
* **FuelType Class**: Enum class to hold the type of fuel used (Petrol, Diesel, Electric)

### *Json Group*<br>
* Contains the json data for the classes

### *Utility Group*<br>
* **IDisplay Class**: Interface containing one method public void display()
* **Calculation Class**: Used in age calculation
* **FileHandler**: Used to handle the json files
* **PasswordUtil**: Contains methods for encryption and decryption

### *Extensions Group*
* **String+Extension**: Contains method for date formatting
* **Float+Extension**: Contains method to format price

### *Exceptions Group*
* Contains validations for json handling as well as verification of email address and phone numbers

### *Others*
* **VehicleRent Class**: Contains renting information

## JIRA
[Click here for JIRA link](https://abhisheksj.atlassian.net/secure/RapidBoard.jspa?rapidView=2&projectKey=MAD31152&view=planning&selectedIssue=MAD31152-21&issueLimit=100)

## PROJECT OUTPUT
[Click here to view the project screenshots](https://drive.google.com/file/d/1ku2HbQXuP6Ztvvimrkxhx7DUfMCdyY98/view?usp=sharing)
## REFERENCES
* [Swift Developer Blog](http://swiftdeveloperblog.com/code-examples/validate-email-address-code-example-in-swift/) - For validating the email of customers.
* [Jsonplaceholder](https://jsonplaceholder.typicode.com/) - JSON reference
* [HackingWithSwift](https://www.hackingwithswift.com/example-code/system/how-to-parse-json-using-jsonserialization) - Used to implement json file reading
* [Knowlegde Stack](http://www.knowstack.com/swift-nsdateformatter/) - Reference for age calculation from birthdate
* [Tutlane](https://www.tutlane.com/tutorial/ios/ios-tutorial) - Basic reference for building iOS apps
