import Foundation
/*class Robot {
    var height: Double
    var colour: String
    //Other properties
    init(){
        //Function to initialise the Robot
    }
    func move(direction: String){
        //Function to increase the temperature
    }
    //Other methode for the Class
}*/

/*
 Tasks:
 - Create a Fridge Class
 - The Fridge class shall have these properties:
    - temperature: default 6.0
    - light: default false
    - drinks: default empty array
    - food: default empty array
    - colour: no default value, set during the initialization
 - Initialization:
    - set the colour
 - Methods:
    - increase temperature
    - decrease temperature
    - turn the light ON when open the door
    - turn the light OFF when close the door
    - display the temperature with format: X.X°C (ex: 3.0°C)
 When close is done:
 - create a fridge (pick the colour you want)
 - display the current temperature
 - decrease the temperature from 3 degrees using the method
 - display the new temperature
 - add food and drink in the fridge
 */
/*
 Now we want to create a class for our fridge
 */

class Fridge {//kumpulan kesatuan fungsi yang saling bersinergi dalam proses kerjanya
    var temperature: Float = 6.0// bagian komponen variable pembentuk class
    var light: Bool = false
    var drinks: [String]?// kalau mau buat array kosong tanpa optional
    var foods: [String]?//var food = [String/Int]()
    var colour: String
    // init selalu dibawah deklarasi variabel
    init(colour: String){
        self.colour = colour
    }
    
    func insideFridge() {
        print(drinks)
        print(foods)
    }
    
    // We create a methode to increase the fridge's temperature
    func increaseTemperature() {//fungsi berperan sebagai fungsi tertentu yang dapat menyingkat suatu tugas agar tidak di tulis berulang kali
        temperature = temperature + 1.0
    }
    
    // Now another method to decrease the fridge's temperature
    func decreaseTemperature() {
        temperature = temperature - 1.0
    }
    
    // Now let's handle the display of the temperature inside the fridge
    func displayTemperature() {
        print("\(temperature)°C")
    }
    
    // Let's managage now what happens when we open the door
    func openTheDoor() {
        light = true
    }
    
    // And now what happens when we close the door
    func closeTheDoor() {
        light = false
    }
}

// This is how to pass a value to the init()
var myFridge: Fridge = Fridge(colour: "Pink")
 
// Let's make sure the colour of our fridge is the one we chose
// this is how to call a property from class
print(myFridge.colour)

// let's check what our fridge' temperature
// This is how to call a method from the class
myFridge.displayTemperature()

// Let's decrease the temperature now
// This temperature will be automatically re-calculated thanks to the methods
myFridge.decreaseTemperature()
myFridge.decreaseTemperature()
myFridge.decreaseTemperature()

myFridge.displayTemperature()

// we can now fill our fridge by writting the value
myFridge.drinks = ["Milk Bottle", "Milk Bottle", "Water Bottle"]
myFridge.foods = ["Yogurt","Sambal"]

myFridge.insideFridge()

/*
 Some task for you:
 - create another Fridge
 - set some food, drinks, and increase the temperature from 2°C
 - open a door and see what's the new value for the light property
 */
