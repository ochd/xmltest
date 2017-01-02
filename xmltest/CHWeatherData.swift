//
//  CHWeatherData.swift
//  xmltest
//
//  Created by Dietrich Och on 06.03.16.
//  Copyright © 2016 newturn Ltd. All rights reserved.
//

import UIKit

class CHWStation: NSObject {
    var stationcode: String
    var timestamp: String
    var winddirection: Double
    var lat: Double
    var lng: Double
    
    override init() {
        stationcode = ""
        timestamp = ""
        winddirection = 0.0
        lat = 0.0
        lng = 0.0
    }
    
    override class func description() -> String {
        // let val = "Code \(stationcode) Time \(timestamp)"
        
        return("Test")
    }
    
    func text() -> String {
        return "Station: \(stationcode) Time: \(timestamp)  WindDir: \(winddirection) Lat: \(lat) Lng:˙\(lng)"
    }
    
}


class CHWeatherData: NSObject {
    var data: Data
    var endpoint: URL
    var stations = [CHWStation]()
    
    override init() {
        var item: NSMutableDictionary
        
        endpoint = URL(string: "http://data.netcetera.com:80/smn/smn")!
        data = try! Data(contentsOf: endpoint)
        do {
            let json: NSMutableArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableArray
            for item in json {
                let station = CHWStation()
                // station.stationcode = item["code"] as! String
                // station.timestamp = item["dateTime"] as! String
                // station.winddirection = item["windDirection"]
                // let statdet = item["station"] as! NSMutableDictionary
                // station.lat = statdet["lat"] as! Double
                // station.lng = statdet["lng"] as! Double
                
                stations.append(station)
                
                print(item)
            }
            
            for stat in stations {
                print(stat.text())
            }
            
        } catch {
            print("rror")
        }
        super.init()
    }
    

}
