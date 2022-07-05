//
//  DataModel.swift
//  SpaceX
//
//  Created by Anıl Demirci on 5.07.2022.
//

import Foundation


struct DataModel: Decodable {
    let links: Links
    let missionName: String
    let launchYear: String
    
    enum CodingKeys: String, CodingKey {
    case missionName = "mission_name"
    case links
    case launchYear = "launch_year"
    }
    
}

struct Links: Decodable {
    let missionPatch, missionPatchSmall: String?

    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
    }
}

