//
//  RankModel.swift
//  Focus
//
//  Created by Frank chen on 5/25/21.
//

import Foundation

struct rankModel {
    let userName: String
    let total_time: Int
}

extension rankModel: Identifiable {
    var id: String { userName }
}
