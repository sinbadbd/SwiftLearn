import UIKit

var str = "Hello, playground"

func swapTowInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var typeInt2 = 10
var typeInt3 = 20

swapTowInts(&typeInt2, &typeInt3)
print("typeInt2 is now \(typeInt2), and typeInt3 is now \(typeInt3)")


//print(swapTowInts(&typeInt2, &typeInt3))

//MARK:: Generic Functions

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
 
var oneTypeString = "Hello..."
var twoTypeString = "World..."

var oneTypeInt = 12
var twoTypeInt = 122


var oneTypeDouble = "Hello..."
var twoTypeDouble = "World..."


var oneTypeFloat = "Hello..."
var twoTypeFloat = "World..."

swap(&oneTypeInt, &twoTypeInt)
swap(&oneTypeString, &twoTypeString)
swap(&oneTypeDouble, &twoTypeDouble)
swap(&oneTypeFloat, &twoTypeFloat)

///TODO ALl Generics print here!

//MARK:: Generic Types

struct Stack {
    var items = [Int]()
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop()-> Int{
     return items.removeLast()
    }
}

var stack = Stack()
stack.push(2)
stack.push(23)
stack.push(3)

print(stack.items)
stack.pop()

print(stack.items)


struct StackGenerics<Element> {
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop()-> Element{
        return items.removeLast()
    }
}

var stackGene  = StackGenerics<Any>()

stackGene.push(1)
stackGene.push("haha")
stackGene.push(21.12)
stackGene.push(2.2)

print(stackGene.items)

extension StackGenerics {
    var topElement: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
if let topItem = stackGene.topElement {
    print("Top element ont he stack\(topItem)")
}

//Associated Types in Action

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count : Int { get  }
    subscript(i: Int) -> Item { get }
}


// MARK:: Without Generics
struct IntStack: Container {
   
    var items =  [Int]()
    
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop()-> Int {
        return items.removeLast()
    }
    
    // conformance to the Container protocol

    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

// MARK:: Generics

struct StackGen<T>: Container {
    
    var items = [T]()
    
    mutating func push(item: T){
        items.append(item)
    }
    mutating func pop()-> T{
        return items.removeLast()
    }
    
    mutating func append(_ item: T) {
        items.append(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}

var stck = StackGen<Any>()

stck.append(1)
stck.append("imran")
print(stck.items)
