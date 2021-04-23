import UIKit
///https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
var str = "Protocols"


protocol SomeProtocol {
    var mustBeSettable : Int { get set }
    var doesNoted : Int{ get set }
}
protocol AnotherProtocol {
    static var someTypeProperty: Int {get set }
}
protocol FullNamed {
    var fullName: String { get }
}

struct Person: FullNamed {
    var fullName: String
}
 
let jhon = Person(fullName: "my name is sinbad")
print(jhon)


class StarShip: FullNamed {
    
    var prefix: String?
    var name: String
 
    init(name: String, prefix:String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + "" : "") + name
    }
}

var ncc1d = StarShip(name: "Imran ", prefix: " Usss")
print(ncc1d.fullName)


// MARK:: Method Requirments
protocol SomeProtocolMethod {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random()-> Double
}

class LinearCongruentailGenerator : RandomNumberGenerator {
    
    var lastRandom = 42.0
    let m = 12.2
    let a = 3223.32
    let c = 2132.213
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
                    .truncatingRemainder(dividingBy:m))
                return lastRandom / m
    }
}

let generator = LinearCongruentailGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")


//MARK:: Mutating Method Requirements

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print(lightSwitch)

// Initializer Requirements
protocol SomeProtocolReq {
    init(someParameter: Int)
}

class SomeClass: SomeProtocolReq {
    required init(someParameter: Int) {
        
    }
}


class Dice {
    let sides : Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll()-> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentailGenerator())
print(" dice roll is \(d6.roll())")
for _ in 1...5{
  print("Random dice roll is \(d6.roll())")
}

//MARK:: DELEGATION


protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game : DiceGame, didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(_ game: DiceGame)
}
