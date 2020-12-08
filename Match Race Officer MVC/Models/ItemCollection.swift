//
//  BoatCollection.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 08.12.2020.
//

protocol ItemCollectionDelegate {
    func collectionChanged(_ identifier: String)
}

class ItemCollection<T> {
    
    fileprivate var items: [T] = []
    var delegate: ItemCollectionDelegate?
    var identifier: String = ""
    var array: [T] { items }
    var count: Int { items.count }
    
    func access(at index: Int) -> T {
        return items[index]
    }
    
    func append(_ item: T){
        self.items.append(item)
        delegate?.collectionChanged(identifier)
    }
    
    func assign(_ items: [T]) {
        self.items = items
        delegate?.collectionChanged(identifier)
    }
        
    func insert(_ item: T, at index: Int) {
        self.items.insert(item, at: index)
        delegate?.collectionChanged(identifier)
    }
    
    @discardableResult
    func remove(at index: Int) -> T {
        let item = self.items.remove(at: index)
        delegate?.collectionChanged(identifier)
        return item
    }
    
    func update(at index: Int, with item: T) {
        self.items[index] = item
        delegate?.collectionChanged(identifier)
    }
 
}
