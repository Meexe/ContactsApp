//
//  ContentView.swift
//  ContactsApp
//
//  Created by Maxim Pak on 04.11.2019.
//  Copyright © 2019 Maxim Pak. All rights reserved.
//

import SwiftUI
import Contacts

struct ContactList: View {
    var body: some View {
        VStack {
            Text("Contacts")
            List(contactData, id: \.identifier) { contact in
                ContactRow(contact: contact)
            }
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList()
    }
}
