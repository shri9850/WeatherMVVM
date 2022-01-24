//
//  WebServices.swift
//  WeatherAppMVVM
//
//  Created by shree on 23/01/22.
//

import Foundation
class WebServices{
    func load<T>(resources: Resources<T>, completion: @escaping(T?)->()){
        URLSession.shared.dataTask(with: resources.url) { (data, responses, error) in
            guard let data = data, error == nil else{
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(resources.parse(data))
            }
        }.resume()
    }
}
struct Resources<T> {
    let url: URL
    let parse: (Data)->T?
}
