//
//  Persistence.swift
//  A2_iOS_Gadise_101295074
//
//  Created by Gadise Oli on 2026-04-09.
//
import CoreData

struct PersistenceController {

    static let shared = PersistenceController()
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "A2_iOS_Gadise_101295074")

        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data error \(error)")
            }
        }

        seedProductsIfNeeded()
    }

    private func seedProductsIfNeeded() {
        let context = container.viewContext
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        let count = (try? context.count(for: request)) ?? 0

        if count == 0 {
            for i in 1...10 {
                let product = Product(context: context)
                product.productID = Int64(i)
                product.productName = "Product \(i)"
                product.productDescription = "Description for product \(i)"
                //Seed initial 10 products into Core Data
                product.productPrice = Double(i) * 10
                product.productProvider = "Provider \(i)"
            }
            try? context.save()
        }
    }
}
