//
//  ExpenseEntryRowView.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 01/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

import SwiftUI

struct ExpenseEntryRowView: View {
    var entry: ExpenseEntry
    
    var body: some View {
        HStack {
            Text(entry.createdAt.usFormat)
                .fontWeight(.black)
            Spacer()
            Text(entry.prettyValue)
        }
        .padding()
    }
}

#if DEBUG
struct ExpenseEntryRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseEntryRowView(entry: expenses[0].entries[0])
            .previewLayout(.fixed(width: 400, height: 70))
    }
}
#endif
