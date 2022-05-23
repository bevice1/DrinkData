//
//  drinkAPI.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 14.05.22.
//

import Foundation
import Get
import api


struct DrinkAPI {
    let client = APIClient(baseURL: URL(string: "https://api.github.com"))
    
    func getAllUsers() async throws {
        let user: UserDTO = try await client.send(.get("/user")).value
        
    }
}
