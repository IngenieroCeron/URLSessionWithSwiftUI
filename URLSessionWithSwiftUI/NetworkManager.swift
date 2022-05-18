//
//  NetworkManager.swift
//  URLSessionWithSwiftUI
//
//  Created by Eduardo Ceron on 25/10/21.
//

import Foundation

class NetworkManager {
    /* Aqui haremos una closure con escape ara devolver un array de mis datos*/
    func getPosts (completion: @escaping([Post]) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")else {
            fatalError("URL no es correcta o no se ha podido acceder a ella")
        }
        
        URLSession.shared.dataTask(with: url) { datos, respuesta, error in
            
            guard let data = datos, error == nil, let response = respuesta as? HTTPURLResponse else {
                return
            }
            
            if response.statusCode == 200 {
                // Serializamos los datos que tengamos
                
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        completion(posts)
                    }
                } catch let error {
                    print("Ha ocurrido un error: \(error.localizedDescription) ")
                }
            }
        }.resume()
        
    }
}
