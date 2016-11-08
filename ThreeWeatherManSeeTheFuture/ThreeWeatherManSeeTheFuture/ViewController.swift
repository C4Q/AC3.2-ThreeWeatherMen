//
//  ViewController.swift
//  ThreeWeatherManSeeTheFuture
//
//  Created by Tong Lin on 11/7/16.
//  Copyright © 2016 Tong Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private let apiKey = "93163a043d0bde0df1a79f0fdebc744f"
    private var zipCode = "10002"
    
    private let collectionCellIdentifier = "ForcastingWeatherCellIdentifier"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var tempTypesSegment: UISegmentedControl!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDegLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var randomPicView: UIImageView!
    
    var weather: Weather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "See The Future"
        loadData()
    }
    
    func loadData() {
        APIRequestManager.manager.getWeatherData(apiKey: apiKey, zip: zipCode){ (myData: Data?) in
            if myData != nil{
                if let finalWeather = Weather.setWeather(from: myData!){
                    DispatchQueue.main.async {
                        self.weather = finalWeather
                        self.locationLabel.text = self.weather.name
                        self.currentTempLabel.text = String(self.weather.temperture)
                        self.maxTempLabel.text = "Hi: \(String(self.weather.temp_max))"
                        self.minTempLabel.text = "Lo: \(String(self.weather.temp_min))"
                        self.descriptionLabel.text = "Description: \(self.weather.description)"
                        self.pressureLabel.text = "Pressure: \(String(self.weather.pressure))"
                        self.humidityLabel.text = "Humidity: \(String(self.weather.humidity))"
                        self.visibilityLabel.text = "Visibility: \(String(self.weather.visibility))"
                        self.windSpeedLabel.text = "Wind Speed: \(String(self.weather.speed))"
                        self.windDegLabel.text = "Wind Deg: \(String(self.weather.deg))"
                        self.sunriseLabel.text = "Sunrise: \(String(self.weather.sunrise))"
                        self.sunsetLabel.text = "Sunset: \(String(self.weather.sunset))"

                        self.loadImage(name: self.weather.name)
                        dump(finalWeather)
                    }
                }
            }
        }
    }
    
    func loadImage(name: String){
        let imageName: String = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        APIRequestManager.manager.getPicture(weathertype: imageName) {
            (imageData: Data?) in
            if imageData != nil{
                DispatchQueue.main.async {
                    self.randomPicView.image = UIImage(data: imageData!)
                }
            }
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath)
        
        return cell
    }

}

