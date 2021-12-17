//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation

final class Dependencies {
    var apiClient: ApiClient {
       NetworkClient(with: networkSession)
    }

    private var networkSession: NetworkSession {
        URLSession.shared
    }
}
