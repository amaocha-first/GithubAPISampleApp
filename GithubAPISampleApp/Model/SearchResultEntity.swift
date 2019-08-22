//
//  SearchResultEntity.swift
//  GithubAPISampleApp
//
//  Created by Shota Nishizawa on 2019/08/22.
//  Copyright © 2019 Shota Nishizawa. All rights reserved.
//

import Foundation
import Himotoki

struct SearchResultEntity: Decodable {
    
    var repositoryName: String
    var languageName: String
    var userIconImage: String
    var urlBtnText: String
    
    static func decode(_ e: Extractor) throws -> SearchResultEntity {
        return try SearchResultEntity(
            repositoryName: e <| "full_name",
            languageName: e <| "language",
            userIconImage: e <| ["owner", "avatar_url"],
            urlBtnText: e <| "url"
        )
    }
}
