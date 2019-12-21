//
//  DataState.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import protocol ReSwift.StateType

struct DataState: StateType {
    
    
    static var current: DataState {
        return yearvuStore.state.dataState
    }
}

extension DataState: Hashable {
    
}
