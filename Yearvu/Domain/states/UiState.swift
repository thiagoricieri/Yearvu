//
//  UiState.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import protocol ReSwift.StateType

struct UiState: StateType {
    static var current: UiState {
        return yearvuStore.state.uiState
    }
}

extension UiState: Hashable {}
