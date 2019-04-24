//
//  TimelineClient.swift
//  fakestagram
//
//  Created by José Antonio Arellano Mendoza on 4/24/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class TimelineClient: RestClient<[Post]> {
    convenience init() {
        self.init(client: Client(), path: "/api/posts")
    }
}
