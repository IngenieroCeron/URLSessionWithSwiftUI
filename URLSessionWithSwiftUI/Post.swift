//
//  Post.swift
//  URLSessionWithSwiftUI
//
//  Created by Eduardo Ceron on 26/10/21.
//

import Foundation

struct Post: Codable, Hashable, Identifiable {
    let id = UUID()
    let title: String
    let body: String
}
