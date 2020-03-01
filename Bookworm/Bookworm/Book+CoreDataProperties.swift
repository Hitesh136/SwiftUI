//
//  Book+CoreDataProperties.swift
//  Bookworm
//
//  Created by Hitesh Agarwal on 24/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String?
    @NSManaged public var genre: String?
    @NSManaged public var id: UUID?
    @NSManaged public var rating: Int16
    @NSManaged public var review: String?
    @NSManaged public var title: String?

}
