//
//  ContactRow.swift
//  ContactsApp
//
//  Created by Maxim Pak on 04.11.2019.
//  Copyright © 2019 Maxim Pak. All rights reserved.
//

import SwiftUI
import Contacts

struct ContactRow: View {
    var contact: CNContact
    
    var body: some View {
        HStack {
            Text(contact.givenName)
            Text(contact.familyName)
            Spacer()
            Text(contact.phoneNumbers[0].value.stringValue)
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactRow(contact: contactData[0])
            ContactRow(contact: contactData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
