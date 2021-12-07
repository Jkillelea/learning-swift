print("Initialiation")

// Initializers set default values, or compute starting values based on user inputs
// When you assign a default value to a stored property or set its initial value with
// an initializer, it's set directly without calling any propery observers.

struct Farenheit {
    var temperature: Double

    // Basic initializer, sets the property 'temperature' to 32.0
    init() {
        temperature = 32.0
    }
}

// The above could also be written more compactly as:
// struct Farenheit {
//     var temperature: Double = 32.0
// }

var f = Farenheit()
print("The default temperature is \(f.temperature) Farenheit")


// Initialiation can have parameters supplied
struct Celcius {
    var temperatureInCelcius: Double
    
    init(fromFarenheit farenheit: Double) {
        temperatureInCelcius = (farenheit - 32.0) / 1.8
    }

    init(fromKelvin kelvin: Double) {
        temperatureInCelcius = kelvin - 273.15
    }
}

let boilingPointOfWater  = Celcius(fromFarenheit: 212.0)
let freezingPointOfWater = Celcius(fromKelvin:    273.15)


// Optional types are initialized to nil
class SurveyQuestion {
    var text: String // must be initialized by init() function
    var response: String? // optional type, initialized to nil by default

    init(text: String) {
        self.text = text
    }

    func ask() {
        print(text)
    }

    func answer() {
        print(response ?? "")
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, cheese is great!" // response is no longer nil
cheeseQuestion.answer()


// Properties which are declared with 'let' don't change after initialization
class SurveyQuestionTwo {
    let text: String      // A 'let' property since it doesn't change after initialization
    var response: String? // Still a 'var' since it changes after initialization

    init(text: String) {
        self.text = text
    }
}

// Default initializer are provided for any struct or class that provides default values for all its properties
// and dosen't provide any initializer istels.
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

// Because ShoppingListItem has default values for all its properties and it's a base class with no superclass,
// it automatically gains a default initializer that sets all its properties to their default values
// Note, String? defaults to nli
var item = ShoppingListItem()


// Structs get memberwise initialiers added by default. These are slightly different, since not every
// property needs a default value, and properties are initialized by their name.
struct Size {
    var width = 0.0
    var height = 0.0

    // init(width: height:) is automatically created
}

let twoByTwo = Size(width: 2.0, height: 2.0)

// Any property with a default value can be omitted from the initializer
let zeroByTwo  = Size(height: 2.0)
let zeroByZero = Size()

// initializer delegation works differently for value types (structs, enums) and classes.
// value types don't support inheritance, so they have simple initializers. Classes can, so their superclasses
// must also be inititalized.

// A custom 'Rect' structure represents a geometric rectangle using two supporting structures,
// 'Size', and 'Poilnt'. Both of these provide default values of 0.0 for all their properties.

// size is declared above
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var origin = Point() // default initializers
    var size   = Size()

    init () {}

    init (origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    init (center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

// All class properties must be inititalized, including inherited properties. Classes have
// designated initializers like structs, and convenience initalizers. Designated initialisers are the
// ones users call, and there usually is only one or two, and every class must have at least one, even if
// it's inherited. By contrast, a class may have many convenience initalizers, which are used to
// support initialization, though they are not required.

class Foo {
    // designated initializer
    init(/* params */) {
        /* statements */
    }

    // convenience initialiser
    // convenience init(/* params */) {
    //     /* statements */
    // }
}

// Designated initializers must always delegate *up* to their superclass, while convenience initializers
// must always delegate *across* to a designated initializer in the same class.


