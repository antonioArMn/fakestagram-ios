//
//  ProfilePostsClient.swift
//  fakestagram
//
//  Created by José Antonio Arellano Mendoza on 5/10/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class ProfilePostsClient: RestClient<[Post]> {
    convenience init() {
        self.init(client: Client(), path: "/api/profile/posts")
    }
}
