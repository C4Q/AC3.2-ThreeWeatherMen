# AC3.2-ThreeWeatherMen

# Project: ThreeWeatherMen

An app that does stuff related to price comparison.

## Gabriel Breshears

### Switch Statement in API Request

Switch Statements:

We used a combination of Switch statements and Functions to call different APIs. If/else statements can get the job done however Switch statments make your code more legible.
We pulled data from two different APIs. 

The below method in the APIRequestMangager class allows us to call the getPicture method in the view controller.

 func getPicture(name: String, endpiontSwitch: Int, callback: @escaping (Data?) -> Void) {
        let myURL: URL
        
        switch endpiontSwitch {
        case 0:
            myURL = URL(string: "https://source.unsplash.com/random/576x1024")!
        case 1:
            myURL = URL(string: "http://openweathermap.org/img/w/\(name).png")!
        default:
            myURL = URL(string: " ")!
        }
        
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: myURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Error during session: \(error!)")
            }
            guard let validData = data else { return }
            callback(validData)
        }.resume()
    }

Key points about switches:
examples: (written in pseudo code)
var temperature = 55


Combining Case Statements
switch temperature {
case 0,1,2,3:
print("Look ma, it's 1,2,3")
}
Range Matching in Switch
switch temperature {
case 0...49:
print("It is very cold")
}


Using Where Statement in Switch


switch temperature {
Case 0...49 where temperature % 2 == 0:
print("Its cold and even)  
}  




## Edward Anchundia

### Search Bar





## Tong Lin

### Saving Picture to Library

Every time user pressed the button to save the picture, UIImageWriteToSavedPhotosAlbum function will be triggered. This function gonna save the random generated picture to local photo library, and user can use it as background for their Iphone or share on social media platforms. After user pressed the saving button the title of the button will be changed, which notice the user the picture has been saved to library. Also the button will be disable at the same time when button title changed. It will prevent user to save duplicated picture to their library. Whenever the view reloaded or random picture generated again, the button will switch to enable.
