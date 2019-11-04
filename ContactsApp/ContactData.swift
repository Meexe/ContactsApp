//
//  ContactData.swift
//  ContactsApp
//
//  Created by Maxim Pak on 04.11.2019.
//  Copyright © 2019 Maxim Pak. All rights reserved.
//

import SwiftUI
import Contacts

let contactData: [CNContact] = getContacts()

func getContacts() -> [CNContact] {
    
    let contactStore = CNContactStore()
    let keysToFetch = [
        CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
        CNContactPhoneNumbersKey,
        CNContactEmailAddressesKey,
        CNContactThumbnailImageDataKey] as [Any]

    var allContainers: [CNContainer] = []
    do {
        allContainers = try contactStore.containers(matching: nil)
    } catch {
        print("Error fetching containers")
    }

    var results: [CNContact] = []

    for container in allContainers {
        let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)

        do {
            let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
            results.append(contentsOf: containerResults)
        } catch {
            print("Error fetching containers")
        }
    }
    return results
}
