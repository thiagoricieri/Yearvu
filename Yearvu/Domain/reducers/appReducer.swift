//
//  appReducer.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import protocol ReSwift.Action

func appReducer(_ action: Action, _ state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    switch action {
    case let action as AnyDataAction: state.dataState = dataReducer(action, state.dataState)
    case let action as AnyUiAction: state.uiState = uiReducer(action, state.uiState)
    default: break
    }
    
    return state
}
