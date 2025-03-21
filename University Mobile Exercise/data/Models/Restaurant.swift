
import Foundation
import UIKit

//Restaurant model & class. Instances of this class are visually represented by the Restaurant class
struct Restaurant: Identifiable{
    
    //unique identifier (Identifiable protocol).
    let id: UUID
    
    //News title
    let name: String
    
    //name of the image, stored in the assets
    var imageName: String
    
    //image caption
    var imageCaption: String
    
    //text
    let text: String
    
    //Location
    let address: String
    
    //AdditionalInformation
    let additionalAddress: String
    
    //home Menu
    let homeMenu: Menu
    
    //vegi Menu
    let vegiMenu: Menu
    
    //Correct definition of opening times
    let openingTimesInterval: DateInterval
    
    //Initializes a new news object with the parameters
    init(
        id: UUID = UUID(),
        name: String,
        imageName: String,
        imageCaption: String,
        text: String,
        address: String,
        additionalAddress: String,
        lunchMenu: Menu,
        dinerMenu: Menu,
        openingTimeDate: Date,
        openingTimeDuration: Double
    ){
        self.id = id
        self.name = name
        self.imageName = imageName
        self.imageCaption = imageCaption
        self.text = text
        self.address = address
        self.additionalAddress = additionalAddress
        self.homeMenu = lunchMenu
        self.vegiMenu = dinerMenu
        self.openingTimesInterval = DateInterval(start: openingTimeDate, duration: openingTimeDuration)
    }
}

struct Menu{
    let id : UUID
    let name: String
    let ingredients: [String]
    
    init(id: UUID = UUID(), name: String, ingredients: [String]){
        self.id = id
        self.name = name
        self.ingredients = ingredients
    }
}

extension Restaurant {
    
    static let sampleData: [Restaurant] =
    [Restaurant(name: "University Mensa", imageName: "placeholder", imageCaption: "", text: "",  address: "Examplestreet 1, 8001 ExampleCity", additionalAddress: "MM Building", lunchMenu: Menu(name: "Pizza Hawai", ingredients: ["Tomato", "Mozarella", "Ham", "Basil"]), dinerMenu: Menu(name: "Rösti", ingredients: ["Potato", "Onion", "Egg", "Butter"]), openingTimeDate: Date(timeIntervalSince1970: 1642413600), openingTimeDuration: 60*60*8)
      
    ]
    
}

