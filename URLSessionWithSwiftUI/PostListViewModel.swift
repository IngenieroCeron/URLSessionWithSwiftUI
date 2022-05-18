//
//  PostListViewModel.swift
//  URLSessionWithSwiftUI
//
//  Created by Eduardo Ceron on 26/10/21.
//

import Foundation
import Combine

class PostListViewModel: ObservableObject {
    
    init(){
        getPosts()
    }
    
    @Published var posts = [Post] () {
        didSet {
            didChange.send(self)
        }
    }
    
    let didChange = PassthroughSubject<PostListViewModel, Never>()
    
    func getPosts(){
        NetworkManager().getPosts {
            //Voy a asignar lo que traigo de la capa de conexión a una propiedad de mi viewmodel
            self.posts = $0
        }
    }
}
