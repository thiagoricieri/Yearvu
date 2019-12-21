//
//  AppState.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import protocol ReSwift.StateType

struct AppState: StateType {
    var dataState = DataState()
    var uiState = UiState()
    
    static var current: AppState {
        return yearvuStore.state
    }
}

extension AppState: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(dataState)
        hasher.combine(uiState)
    }
    static func == (lhs: AppState, rhs: AppState) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
