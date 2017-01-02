//
//  ClimateSensorData.swift
//  xmltest
//
//  Created by Dietrich Och on 05.03.16.
//  Copyright © 2016 newturn Ltd. All rights reserved.
//

import UIKit

class ClimateSensorData: NSObject, XMLParserDelegate {
    var srcurl = URL()
    var parser = XMLParser()
    var error = false
    var devname = NSString()
    var temp = 0.0
    var tempUnit = NSString()
    var relhum = 0.0
    var relhumUnit = NSString()
    var dewpoint = 0.0
    var dewpointUnit = NSString()
    var timestr = NSString()
    var element = NSString()
    
    var channel = 0
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var title1 = NSMutableString()
    var date = NSMutableString()
    
    
    init(url: URL)
    {
        super.init()
        srcurl = url
        self.update()
    }
    
    func update()
    {
        parser = XMLParser(contentsOf:srcurl)!
        parser.delegate = self
        parser.parse()
    }
    
    func toprint() {
        print("Device:", devname, " Time:", timestr)
        print("Temperatur:", temp, tempUnit)
        print("Humidity:", relhum, relhumUnit)
        print("Dewpoint:", dewpoint, dewpointUnit)
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "ch1") {
            channel = 1
        } else if (elementName as NSString).isEqual(to: "ch2") {
            channel = 2
        } else if (elementName as NSString).isEqual(to: "ch3") {
            channel = 3
        }
    }
        
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if !string.isEmpty && string != "\n" {
            if element.isEqual(to: "devname") {
                devname = string as NSString
            } else if element.isEqual(to: "time") {
                timestr = string as NSString
            } else if element.isEqual(to: "unit") {
                if channel == 1 {
                    tempUnit = NSString(string: string)
                } else if channel == 2 {
                    relhumUnit = NSString(string: string)
                } else if channel == 3 {
                    dewpointUnit = NSString(string: string)
                }
            } else if element.isEqual(to: "aval") {
                if channel == 1 {
                    temp = Double(string)!
                } else if channel == 2 {
                    relhum = Double(string)!
                } else if channel == 3 {
                    dewpoint = Double(string)!
                }
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
/*        if (elementName as NSString).isEqualToString("item") {
            if !title1.isEqual(nil) {
                elements.setObject(title1, forKey: "title")
            }
            if !date.isEqual(nil) {
                elements.setObject(date, forKey: "date")
            }
            
            posts.addObject(elements)
        }
*/
    }
    
}
