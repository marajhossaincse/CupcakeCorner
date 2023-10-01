//
//  CodableForPublishedPropertiesComponent.swift
//  CupcakeCorner
//
//  Created by Maraj Hossain on 10/1/23.
//

import SwiftUI
class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }

    @Published var name = "Maraj Hossain"

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct CodableForPublishedPropertiesComponent: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CodableForPublishedPropertiesComponent_Previews: PreviewProvider {
    static var previews: some View {
        CodableForPublishedPropertiesComponent()
    }
}
