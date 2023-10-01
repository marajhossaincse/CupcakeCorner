//
//  URLSessionComponent.swift
//  CupcakeCorner
//
//  Created by Maraj Hossain on 10/1/23.
//

import SwiftUI

struct Response: Codable {
    var result: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct URLSessionComponent: View {
    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            Text("debug")
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)

                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }

    func loadData() async{
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.result
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct URLSessionComponent_Previews: PreviewProvider {
    static var previews: some View {
        URLSessionComponent()
    }
}
