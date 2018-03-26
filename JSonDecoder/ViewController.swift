//
//  ViewController.swift
//  JSonDecoder
//
//  Created by UnalOzturk on 26.03.2018.
//  Copyright © 2018 UnalOzturk. All rights reserved.
//

import UIKit

struct Course {
    let id: Int
    let name: String
    let link : String
    let imageURL : String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURL = "http://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonURL) else {return}
       
        
        URLSession.shared.dataTask(with: url) { (data, response, Error) in
            guard let data = data else {return}
            let dataAsString = String(data: data, encoding: String.Encoding.utf8)
            print(dataAsString)
            print("Do stuff")
        }.resume()
 
        
        
    }
    
    
}



