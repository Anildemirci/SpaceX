//
//  DataViewModel.swift
//  SpaceX
//
//  Created by Anıl Demirci on 5.07.2022.
//

import Foundation

struct DataListViewModel {
    let dataList : [DataModel]
    
    func numberOfRows() -> Int {
        return dataList.count
    }
    
    func dataAtIndex(_ index: Int) -> DataViewModel {
        let data=dataList[index]
        return DataViewModel(datas: data)
    }
}


struct DataViewModel {
    let datas : DataModel
    
    var missionName : String {
        return datas.missionName
    }
    var launchYear : String {
        return datas.launchYear
    }
    var image : String {
        return datas.links.missionPatch ?? ""
    }
}
