//
//  WebService.swift
//  SpaceX
//
//  Created by Anıl Demirci on 5.07.2022.
//

import Foundation

class WebService : ObservableObject {
    
    func downloadCurrencies(filter:String, url: URL, completion: @escaping ([DataModel]?) -> ()) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                } else if let data = data {
                    
                    let datas = try? JSONDecoder().decode([DataModel].self, from: data)
                    
                    if let datas = datas {
                        
                        DispatchQueue.main.async {
                            if filter == "0" {
                                completion(datas)
                            } else {
                                let sortedPhotos=datas.sorted {
                                    $0.launchYear > $1.launchYear
                                }
                                completion(sortedPhotos)
                            }
                        }
                        
                        
                    }
                    
                }
                
            }.resume()
            
        }
    
}
