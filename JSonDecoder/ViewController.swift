//
//  ViewController.swift
//  JSonDecoder
//
//  Created by UnalOzturk on 26.03.2018.
//  Copyright © 2018 UnalOzturk. All rights reserved.
//

import UIKit

struct websiteDescription: Decodable {
    let name: String?
    let description: String?
    let courses : [Course]?
}

struct Course: Decodable{
    let id: Int?
    let name: String?
    let link : String?
    let imageUrl : String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURL = "http://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonURL) else {return}
       
        
        URLSession.shared.dataTask(with: url) { (data, response, Error) in
            guard let data = data else {return}
            
            do {
                let websiteDescriptions = try JSONDecoder().decode(websiteDescription.self, from: data)
                print(websiteDescriptions)
                //let json = try JSONSerialization.jsonObject(with: data, options:  JSONSerialization.ReadingOptions.mutableContainers)
               // print(json)
            } catch let jsonErr {
                print(jsonErr)
            }
            
        }.resume()
 
        
        
    }
    
    
}



