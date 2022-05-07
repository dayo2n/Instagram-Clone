//
//  SearchViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by 문다 on 2022/05/07.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard  let documents = snapshot?.documents else { return }

//            documents.forEach { snapshot in
//                guard let user = try? snapshot.data(as: User.self) else { return }
//                self.users.append(user)
//            }
            // 이 코드를 compactMap 함수를 이용해 한 줄로 쓸 수 있음 
            
            self.users = documents.compactMap({try? $0.data(as: User.self)})
            // compactMap
            
            print(self.users)
        }
    }
}
