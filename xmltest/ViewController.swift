//
//  ViewController.swift
//  xmltest
//
//  Created by Dietrich Och on 05.03.16.
//  Copyright © 2016 newturn Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sensor = ClimateSensorData(url: URL(string: "http://websensor2/values.xml")!)
    var chweather = CHWeatherData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sensor.update()
        sensor.toprint()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

