//
//  SettingsView.swift
//  Fructus
//
//  Created by Abdelaziz Bennacer on 08/05/2024.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    GroupBox(
                        label: SettingsLabelView(label: "Fructus", icon: "info.circle")
                    ) {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text(
                                "Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins and much more."
                            )
                            .font(.footnote)
                        }
                    }
                    
                    // MARK: - SECTION 2
                    GroupBox(
                        label: SettingsLabelView(label: "Customization", icon: "paintbrush")
                    ) {
                        Divider().padding(.vertical, 4)
                        
                        Text(
                            "If you wish you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again."
                        )
                        .padding(.vertical, 8)
                        .frame(minHeight: 60)
                        .layoutPriority(1)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        
                        Toggle(
                            isOn: $isOnboarding,
                            label: {
                                if isOnboarding {
                                    Text("Restarted".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundStyle(.green)
                                } else {
                                    Text("Restart".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        )
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    
                    // MARK: - SECTION 3
                    GroupBox(
                        label: SettingsLabelView(label: "Application", icon: "apps.iphone")
                    ) {
                        
                        SettingsRowView(title: "Developer", content: "Abdel")
                        SettingsRowView(title: "Designer", content: "Robert Petras")
                        SettingsRowView(title: "Compatibility", content: "iOS 17")
                        SettingsRowView(title: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                        SettingsRowView(title: "Twitter", linkLabel: "@AbdelBen", linkDestination: "twitter.com")
                        SettingsRowView(title: "SwiftUI", content: "5.0")
                        SettingsRowView(title: "Version", content: "1.1.0")
                    } //: BOX
                    
                } //: VSTACK
                .navigationBarTitle(Text("Settings"))
                .navigationBarItems(trailing: 
                    Button(
                        action: { presentationMode.wrappedValue.dismiss() },
                        label: { Image(systemName: "xmark") }
                    )
                )
                .navigationBarTitleDisplayMode(.large)
                .padding()
            } //: SCROLL
        } //: NAV
    }
}

#Preview {
    SettingsView()
}
