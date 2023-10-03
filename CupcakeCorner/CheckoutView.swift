//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Maraj Hossain on 10/2/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order

    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false

    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode error.")
            return
        }

        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

            let decodedOder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOder.quantity) x \(Order.types[decodedOder.type].lowercased()) cupcakes is on its way."
            showingConfirmation = true
        } catch {
            confirmationMessage = "Check your internet connection"
            showingConfirmation = true
            print("Checkout Failed!")
        }
    }

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

                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank You!", isPresented: $showingConfirmation) {
            Button("Ok") {}
        } message: {
            Text(confirmationMessage)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
