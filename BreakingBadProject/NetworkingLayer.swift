//
//  NetworkingLayer.swift
//  BreakingBadProject
//
//  Created by Kevin Tarr on 9/16/22.
//

import Foundation


import Foundation
import UIKit


class NetworkingLayer{
    
    func loadData() async -> [ModelData] {
        let request = URLRequest(url: URL(string: "https://www.breakingbadapi.com/api/characters")!)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let results = try JSONDecoder().decode([ModelData].self, from: data)
            
            return results
        } catch let DecodingError.dataCorrupted(context) {
                            print(context)
                        } catch let DecodingError.keyNotFound(key, context) {
                            print("Key '\(key)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.valueNotFound(value, context) {
                            print("Value '\(value)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.typeMismatch(type, context)  {
                            print("Type '\(type)' mismatch:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        }
        catch {
            print("Error: Failed to fetch")
        }
        
        return []
    }
    
}

