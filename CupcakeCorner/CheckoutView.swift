//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Maraj Hossain on 10/2/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(
                    url: URL(string: "http://hws.dev/img/cupcakes@3x.jpg"),
                    scale: 3)
                { image in
                    image
                        .resizable()
                        .scaledToFit()

                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total in \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place order", action: {})
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
