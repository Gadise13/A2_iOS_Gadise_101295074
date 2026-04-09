//
//AddProductView.swift
//  A2_iOS_Gadise_101295074
//  Created by Gadise Oli on 2026-04-09.
//
import SwiftUI
import CoreData

struct AddProductView: View {

    @Environment(\.managedObjectContext) private var context

    @State private var name = ""
    @State private var description = ""
    @State private var price = ""
    @State private var provider = ""

    var body: some View {
        Form {
            TextField("Product Name", text: $name)
            TextField("Description", text: $description)
            TextField("Price", text: $price)
            TextField("Provider", text: $provider)

            Button("Save Product") {
                let p = Product(context: context)
                p.productID = Int64(Date().timeIntervalSince1970)
                p.productName = name
                p.productDescription = description
                p.productPrice = Double(price) ?? 0
                p.productProvider = provider

                try? context.save()
            }
        }
        .navigationTitle("Add Product")
    }
}
