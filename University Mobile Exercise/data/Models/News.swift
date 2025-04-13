
import Foundation
import UIKit

//News base model & class. Instances of this class are visually represented by the NewsView  class
class News: Identifiable{
    
    //unique identifier (Identifiable protocol).
    let id: UUID
    
    //News title
    let title: String
    
    //News text
    let text: String
    
    //A short preview text shown in the card view
    let preview_text: String
    
    //The publishing date of the news
    let date: Date
    
    //Initializes a new news object with the parameters
    init(id: UUID = UUID(), title: String, text: String, preview_text: String, date: Date){
        self.id = id
        self.title = title
        self.text = text
        self.preview_text = preview_text
        self.date = date
    }
}


// Subclass of the news class. Additionaly to the news class, which only displays textual information, the ImageNews class displays also an image.
final class ImageNews: News {
    
    //name of the image, stored in the assets
    var imageName: String
    
    //image caption
    var imageDescription: String
    
    //initializes a new image news object with the parameters
    init(id: UUID = UUID(), title: String, text: String, preview_text: String, date: Date, imageName: String, imageDescription: String){
        self.imageName = imageName
        self.imageDescription = imageDescription
        super.init(id: id, title: title, text: text, preview_text: preview_text, date: date)
    }
}

final class Publication: News{}


//Sample instance of the news class which are displayed as a list of news in the news view
extension News {
    static let sampleData: [News] =
    [News(title: "Here is Geneva", text: "Geneva is the second largest city in Switzerland after Zurich and the most international city in Europe, with over 40% of the population coming from abroad. The main economic sectors are banking, intergovernmental and non-governmental administration, technology and tourism. Geneva boasts of being one of the most beautiful and cultured cities in the world, combining the splendor of nature with a rich array of historical and architectural offerings. In addition, the city is an important gateway to the Alps for outdoor enthusiasts all year round.", preview_text: "A short summary on Geneva" ,date: Date(timeIntervalSince1970: 1640786789)),
     ImageNews(title: "Here is Zurich ", text: "Zurich is the largest city in Switzerland and the capital of the Canton of Zurich. It is located in northern central Switzerland, at the northwestern tip of Lake Zurich. ", preview_text: "A short summary on Zurich", date: Date(timeIntervalSince1970: 1640283000), imageName: "image123456", imageDescription: "Zurich at Night"),
    
    ]

    
}

extension Publication{
    static let samplePublication: [Publication] =
    [Publication(title: "Publication 1", text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", preview_text: "A short preview text to advertise the publication" ,date: Date(timeIntervalSince1970: 1640386789)),
     Publication(title: "Publication 2", text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", preview_text: "A short preview text to advertise the publication", date: Date(timeIntervalSince1970: 1640083000))
    ]
}
