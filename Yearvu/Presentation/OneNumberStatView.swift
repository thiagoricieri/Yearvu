//
//  OneNumberStatView.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 01/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

import SwiftUI

struct OneNumberStatView: View {
    let period: String
    let value: String
    
    var body: some View {
        VStack {
            Text(period)
                .foregroundColor(.gray)
            Text(value)
                .fontWeight(.bold)
        }
    }
}

#if DEBUG
struct OneNumberStatView_Previews: PreviewProvider {
    static var previews: some View {
        OneNumberStatView(
            period: "Spent in 1 year",
            value: "USD 365.00"
        )
        .previewLayout(.fixed(width: 240, height: 100))
    }
}
#endif
