import UIKit

import Combine

var greeting = "Hello, playground"


public func example(of description:String, action:@escaping()-> Void){
    print("\n example of",description, "------")
    action()
}
let notificationName = Notification.Name("myntification")
let publisher = NotificationCenter.default.publisher(for: notificationName, object: nil)

example(of: "Hello publisher") {
    
    
    
    let center = NotificationCenter.default
    
    let observerxx = center.addObserver(forName: notificationName, object: nil, queue: nil) {noti in
        print("Recived notification ",noti)
    }
    center.post(name: notificationName,object: nil)
    center.removeObserver(observerxx)
}


let subs = publisher
    .sink { _ in
        print("Notification receviced form publisher!")
    }
