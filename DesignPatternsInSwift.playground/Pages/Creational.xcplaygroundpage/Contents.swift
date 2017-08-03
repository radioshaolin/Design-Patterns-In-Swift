//: [Behavioral](Behavioral) |
//: Creational |
//: [Structural](Structural)
/*:
 Creational
 ==========
 
 > In software engineering, creational design patterns are design patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation. The basic form of object creation could result in design problems or added complexity to the design. Creational design patterns solve this problem by somehow controlling this object creation.
 >
 >**Source:** [wikipedia.org](http://en.wikipedia.org/wiki/Creational_pattern)
 */
import Swift
import Foundation
import UIKit
import PlaygroundSupport

/*:
 🗿 Prototype
 ------------
 
 The prototype pattern is used to instantiate a new object by copying all of the properties of an existing object, creating an independent clone.
 This practise is particularly useful when the construction of a new object is inefficient.
 
 ### Example
 */
// Realisation of Card class for cardboard game with clone() function

class Card {
    var name: String?
    var mana: Int?
    var attack: Int?
    var defense: Int?

    init(name: String?, mana: Int?, attack: Int?, defense: Int?) {
        self.name = name
        self.mana = mana
        self.attack = attack
        self.defense = defense
    }

    func clone() -> Card {
        return Card(name: self.name, mana: self.mana, attack: self.attack, defense: self.defense)
    }
    
    func toString() -> String{
        if let name = self.name,
            let mana = self.mana,
            let attack = self.attack,
            let defense = self.defense {
            return "Card name: \(name), Mana: \(mana), Attack: \(attack), Defense: \(defense)"
        } else { return "Some properties are nil" }
    }
}
/*:
 ### Usage
 */
// This is the card that we will copy
let raidLeader = Card(name: "Raid Leader", mana: 3, attack: 2, defense: 2)

// Clonning card with our clone() function
let facelessManipulator = raidLeader.clone()
print(facelessManipulator.toString())

/*:
 🏭 Factory Method
 -----------------
 
 The factory pattern is used to replace class constructors, abstracting the process of object generation so that the type of the object instantiated can be determined at run-time.
 
 ### Example
 */
//Product Base
protocol Shape {
    var shapeType: ShapeType { get }
    func draw() -> String
}


extension Shape {
    func draw() -> String {
        return "\(self.shapeType.rawValue) is drawing"
    }
}

//Concrete products
class Square: Shape {
    var shapeType = ShapeType.square
}

class Circle: Shape {
    var shapeType = ShapeType.circle
}

class Triangle: Shape {
    var shapeType = ShapeType.triangle
}

enum ShapeType: String {
    case square = "Square"
    case circle = "Circle"
    case triangle = "Triangle"
}


// ConcreteFactory
class ShapeFactory {
    static func createShape(shapeType: ShapeType) -> Shape {
        switch shapeType {
            case .circle: return Circle()
            case .square: return Square()
            case .triangle: return Triangle()
        }
    }
}
/*:
 ### Usage
 */
let circle = ShapeFactory.createShape(shapeType: .circle)
let triangle = ShapeFactory.createShape(shapeType: .triangle)
print("\(circle.draw()), \(triangle.draw())")


/*:
 🐙 Singleton
 ------------
 
 The singleton pattern ensures that only one object of a given type exists and that all components that depend on that object use the same instance.
 
 ### Example
 */
class MonsterBoss {
    static let sharedInstance = MonsterBoss()
    private init() {
        print("Singleton \(name) is initialized")
    }
    // other methods and properties
    var name = "🐙"
}
/*:
 ### Usage
 */
let monsterBoss = MonsterBoss.sharedInstance
monsterBoss.name = "🦀"

let anotherMonsterBoss = MonsterBoss.sharedInstance
print(anotherMonsterBoss.name)

/*:
 🏗	 Abstract Factory
 --------------------
 
 The abstract factory pattern allows a calling component to create a group of related objects. The pattern hides the details of which classes are used to create the objects and the reason why they were selected from the calling component. This pattern is similar to the Factory Method pattern, but presents the calling component with a set of objects.
 
 ### Example
 */
//Our interfaces
protocol IWatchBand {
    var color: UIColor { get set }
    var size: BandSize { get set }
    var type: BandType { get set }
    init(size: BandSize)
}

protocol IWatchDial {
    var material: MaterialType { get set }
    var size: WatchSize { get set }
    init(size: WatchSize)
}

//Enums
enum MaterialType: String {
    case Aluminium = "Aluminium",
    StainlessSteel = "Stainless Steel",
    Gold = "Gold"
}

enum BandType: String {
    case Milanese = "Milanese",
    Classic = "Classic",
    Leather = "Leather",
    Modern = "Modern",
    LinkBracelet = "LinkBracelet",
    SportBand = "SportBand"
}

enum WatchSize: String {
    case _38mm = "38mm", _42mm = "42mm"
}

enum BandSize: String {
    case SM = "SM", ML = "ML"
}

// Prepare Bands
class MilaneseBand: IWatchBand {
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.Milanese
    required init(size _size: BandSize) {
        size = _size
    }
}

class Classic: IWatchBand {
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.Classic
    required init(size _size: BandSize) {
        size = _size
    }
}

class Leather:IWatchBand{
    var color = UIColor.yellow
    var size:BandSize
    var type = BandType.Leather
    required init(size _size: BandSize) {
        size = _size
    }
}

class Modern: IWatchBand {
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.Modern
    required init(size _size: BandSize) {
        size = _size
    }
}

class LinkBracelet: IWatchBand {
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.LinkBracelet
    required init(size _size: BandSize) {
        size = _size
    }
}

class SportBand: IWatchBand {
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.SportBand
    required init(size _size: BandSize) {
        size = _size
    }
}
//Dials
class AluminiumDial: IWatchDial {
    var material: MaterialType = MaterialType.Aluminium
    var size: WatchSize
    required init(size _size:WatchSize){
        size = _size
    }
}

class StainlessSteelDial: IWatchDial {
    var material: MaterialType = MaterialType.StainlessSteel
    var size: WatchSize
    required init(size _size:WatchSize){
        size = _size
    }
}

class GoldDial: IWatchDial {
    var material: MaterialType = MaterialType.Gold
    var size: WatchSize
    required init(size _size:WatchSize){
        size = _size
    }
}
//Our AbstractFactory
class WatchFactory {
    
    func createBand(_ bandType: BandType) -> IWatchBand {
        fatalError("not implemented")
    }
    func createDial(_ materialtype: MaterialType) -> IWatchDial{
        fatalError("not implemented")
    }
    
    //our static method that return the appropriated factory.
    final class func getFactory(_ size: WatchSize) -> WatchFactory{
        var factory: WatchFactory?
        switch(size){
        case ._38mm:
            factory = Watch38mmFactory()
        case ._42mm:
            factory = Watch42mmFactory()
        }
        return factory!
    }
}
// Concrete Factory 1 for 42 mm
class Watch42mmFactory: WatchFactory {
    override func createBand(_ bandType: BandType) -> IWatchBand {
        switch bandType {
        case .Milanese:
            return MilaneseBand(size: .ML)
        case .Classic:
            return Classic(size: .ML)
        case .Leather:
            return Leather(size: .ML)
        case .LinkBracelet:
            return LinkBracelet(size: .ML)
        case .Modern:
            return Modern(size: .ML)
        case .SportBand:
            return SportBand(size: .ML)
        }
    }
    
    override func createDial(_ materialtype: MaterialType) -> IWatchDial {
        switch materialtype{
        case MaterialType.Gold:
            return GoldDial(size: ._42mm)
        case MaterialType.StainlessSteel:
            return StainlessSteelDial(size: ._42mm)
        case MaterialType.Aluminium:
            return AluminiumDial(size: ._42mm)
        }
    }
}
//Concrete Factory 2 for 38mm
class Watch38mmFactory: WatchFactory{
    override func createBand(_ bandType:BandType) -> IWatchBand {
        switch bandType {
        case .Milanese:
            return MilaneseBand(size: .SM)
        case .Classic:
            return Classic(size: .SM)
        case .Leather:
            return Leather(size: .SM)
        case .LinkBracelet:
            return LinkBracelet(size: .SM)
        case .Modern:
            return Modern(size: .SM)
        case .SportBand:
            return SportBand(size: .SM)
        }
    }
    
    override func createDial(_ materialtype: MaterialType) -> IWatchDial {
        switch materialtype{
        case MaterialType.Gold:
            return GoldDial(size: ._38mm)
        case MaterialType.StainlessSteel:
            return StainlessSteelDial(size: ._38mm)
        case MaterialType.Aluminium:
            return AluminiumDial(size: ._38mm)
        }
    }
}
/*:
 ### Usage
 */
//Here we deliver products from the Manufacture 1 specialized in
//products for the 38 mm Watch
let manufacture1 = WatchFactory.getFactory(WatchSize._38mm)

let productA = manufacture1.createBand(BandType.Milanese)
print(productA.size.rawValue, productA.type.rawValue)

let productB = manufacture1.createDial(MaterialType.Gold)
print(productB.material.rawValue, productB.size.rawValue)

//Here we delivers products from the Manufacture 2 specialized in
//products for the 42 mm Watch»
let manufacture2 = WatchFactory.getFactory(WatchSize._42mm)

let productC = manufacture2.createBand(BandType.LinkBracelet)
print(productC.size.rawValue, productC.type.rawValue)

let productD = manufacture2.createDial(MaterialType.Gold)
print(productD.material.rawValue, productD.size.rawValue)

/*:
 👷 Builder
 ----------
 The builder pattern is a design pattern that allows for the step-by-step creation of complex objects using the correct sequence of actions. The construction is controlled by a director object that only needs to know the type of object it is to create.
 
 ### Example
 */
class MealDirector {
    func makeMeal(_ mealBuilder: MealBuilder) -> () {
    mealBuilder.addSandwich()
    mealBuilder.addSideOrder()
    mealBuilder.addDrink()
    mealBuilder.addOfferItem()
    mealBuilder.setPrice()
    }
}

class Meal {
    var sandwich: String?
    var sideOrder: String?
    var drink: String?
    var offer: String?
    var price: Double?
    
    func ToString() -> String {
        guard let sandwich = sandwich, let sideOrder = sideOrder, let drink = drink, let offer = offer,  let price = price  else { return "Nil value detected" }
        return "\(sandwich, sideOrder, drink, offer, String(format: "%.2f", price))"
    }
}

protocol MealBuilder {
    func addSandwich() -> Void
    func addSideOrder() -> Void
    func addDrink() -> Void
    func addOfferItem() -> Void
    func setPrice() -> Void
    func getMeal() -> Meal
}

class JollyVegetarianMealBuilder : MealBuilder {
    var meal = Meal()
    
    func addSandwich() { meal.sandwich = "Vegeburger" }
    func addSideOrder() { meal.sideOrder = "Fries" }
    func addDrink() { meal.drink = "Orange juice" }
    func addOfferItem() { meal.offer = "Donut voucher" }
    func setPrice() { meal.price = 4.99 }
    func getMeal() -> Meal { return meal }
}

class MischievousMexicanBuilder : MealBuilder {
    var meal = Meal()
    
    func addSandwich() { meal.sandwich = "Spicy burger" }
    func addSideOrder() { meal.sideOrder = "Nachos" }
    func addDrink() { meal.drink = "Tequila" }
    func addOfferItem() { meal.offer = "Hat" }
    func setPrice() { meal.price = 5.49 }
    func getMeal() -> Meal { return meal }
}
/*:
 ### Usage
 */
var director = MealDirector()

var jvmBuilder = JollyVegetarianMealBuilder()
director.makeMeal(jvmBuilder)
var vegMeal = jvmBuilder.getMeal()
print(vegMeal.ToString())

var mmBuilder = MischievousMexicanBuilder()
director.makeMeal(mmBuilder)
var mexMeal = mmBuilder.getMeal()
print(mexMeal.ToString())
