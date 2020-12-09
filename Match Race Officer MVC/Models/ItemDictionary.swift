//
//  StageFormatCollection.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 09.12.2020.
//


protocol ItemDictionaryDelegate {
    func dictionaryChanged(_ identifier: String)
}

class ItemDictionary<T> {
    fileprivate var items: [String:T] = [:]
    var delegate: ItemArrayDelegate?
    var identifier: String = ""
    // Read-only properties
    var count: Int { items.count }
    var dictionary: [String:T] { items }
    var keys: [String] { Array(items.keys) }
    var values: [T] { Array(items.values) }
    

    func access(_ key: String) -> T? {
        return self.items[key]
    }
    
    func append(key: String, value: T) {
        self.items[key] = value
        delegate?.collectionChanged(identifier)
    }
    
    func assign(_ items: [String:T]) {
        self.items = items
        delegate?.collectionChanged(identifier)
    }
        
    func insert(_ value: T, as key: String) {
        self.items[key] = value
        delegate?.collectionChanged(identifier)
    }
    
    @discardableResult
    func remove(_ key: String) -> T? {
        let item = self.items.removeValue(forKey: key)
        delegate?.collectionChanged(identifier)
        return item
    }
    
    func removeAll() {
        items.removeAll()
    }
    
    func update(at key: String, with value: T) {
        self.items[key] = value
        delegate?.collectionChanged(identifier)
    }
}
