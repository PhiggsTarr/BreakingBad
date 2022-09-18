//
//  ModelData.swift
//  BreakingBadProject
//
//  Created by Kevin Tarr on 9/16/22.
//

import Foundation

//Struct created to model JSON Data we want for Breaking Bad Characters 
struct ModelData : Codable{
    let name: String
    let img: String
    let nickname: String
}

