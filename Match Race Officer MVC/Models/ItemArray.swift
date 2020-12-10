//
//  BoatCollection.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 08.12.2020.
//

protocol ItemArrayDelegate {
    func collectionChanged(_ identifier: String)
}

class ItemArray<T> {
    
    fileprivate var items: [T] = []
    var delegate: ItemArrayDelegate?
    var identifier: String = ""
    var array: [T] { items }
    var count: Int { items.count }
    
    func access(at index: Int) -> T {
        return items[index]
    }
    
    func append(_ item: T) {
        self.items.append(item)
        self.delegate?.collectionChanged(identifier)
    }
    
    func assign(_ items: [T]) {
        self.items = items
        self.delegate?.collectionChanged(identifier)
    }
        
    func insert(_ item: T, at index: Int) {
        self.items.insert(item, at: index)
        self.delegate?.collectionChanged(identifier)
    }
    
    @discardableResult
    func remove(at index: Int, callingDelegate callDelegate: Bool = true) -> T {
        let item = self.items.remove(at: index)
        if callDelegate { self.delegate?.collectionChanged(identifier) }
        return item
    }
    
    func removeAll(keepingCapacity keepCapacity: Bool = false) {
        self.items.removeAll(keepingCapacity: keepCapacity)
        self.delegate?.collectionChanged(self.identifier)
    }
    
    func update(at index: Int, with item: T) {
        self.items[index] = item
        self.delegate?.collectionChanged(identifier)
    }
 
}
