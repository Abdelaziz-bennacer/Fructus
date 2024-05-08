//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Abdelaziz Bennacer on 08/05/2024.
//

import SwiftUI

struct SettingsRowView: View {
    var title: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(title).foregroundStyle(Color.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundStyle(.pink)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

#Preview {
    VStack {
        SettingsRowView(title: "Developer", content: "Abdel")
        SettingsRowView(title: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
    }
}
