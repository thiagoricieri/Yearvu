//
//  YearvuStore.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import class ReSwift.Store

typealias YearvuStoreType = Store<AppState>

let yearvuStore = YearvuStoreType(
    reducer: appReducer,
    state: nil
)
