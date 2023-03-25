//
//  ContentViewModelPodcast.swift
//  BaudoAP
//
//  Created by Codez on 24/03/23.
//

import Foundation


import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth

class ContentViewModelPodcast: ObservableObject {
    @Published var postsPodcast: [Post] = []
    
    
    init() {
        fetchpostsPodcast()
    }
    
//    Function for Fetch posts from firebase
    func fetchpostsPodcast() {
        
        // NECESARIO ??
       postsPodcast.removeAll()
        let db = Firestore.firestore()
        
        let refPodcast = db.collection("Posts").whereField("Typo", isEqualTo: "Podcast")
        
        //let ImagenesContent = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        
//        print("Estos son los post de Imagenes", refImage)
        

        
        refPodcast.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {

                    let data = document.data()
                    
                    let id: String = UUID().uuidString
                    let Thumbnail = data["Thumbnail"] as? String ?? ""
                    let Author = data["Author"] as? String ?? ""
                    let Location = data["Location"] as? String ?? ""
                    let MainMediaUrl = data["MainMediaUrl"] as? String ?? ""
                    let Typo = data["Typo"] as? String ?? ""
                    let Description = data["Description"] as? String ?? ""
                    let Category = data["Category"] as? String ?? ""
                    let Title = data["Title"] as? String ?? ""
                    let CreationDate = data["CreationDate"] as? String ?? ""
                    
                    let post = Post(id: id,Thumbnail: Thumbnail,Author: Author,Location: Location, MainMediaUrl: MainMediaUrl, Typo: Typo, Description: Description,Category: Category,Title: Title,CreationDate: CreationDate)
                    self.postsPodcast.append(post)
                    
                }
            }
        }
        

    }
   
}
