//
//  FormValidationComponent.swift
//  CupcakeCorner
//
//  Created by Maraj Hossain on 10/1/23.
//

import SwiftUI

struct FormValidationComponent: View {
    @State private var username = ""
    @State private var email = ""

    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create Account") {
                    print("Creating account...")
                }
            }
            .disabled(disabledForm)
//            .disabled(username.isEmpty || email.isEmpty)
        }
    }
}

struct FormValidationComponent_Previews: PreviewProvider {
    static var previews: some View {
        FormValidationComponent()
    }
}
