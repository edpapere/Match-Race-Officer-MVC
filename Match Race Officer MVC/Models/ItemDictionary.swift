//
//  StageFormatCollection.swift
//  Match Race Officer MVC
//
//  Created by Andrey Pereslavtsev on 09.12.2020.
//

// OrderedDictionary structure by Lukas Kubanek:
//   + similar idea
//   + better implementation
//   - structure not a class
//   - w/o delegate
// https://github.com/lukaskubanek/OrderedDictionary
//
// Nice article describing concept of OrderedDictionary:
// https://www.timekl.com/blog/2014/06/02/learning-swift-ordered-dictionaries/


protocol ItemDictionaryDelegate {
    func dictionaryChanged(_ identifier: String)
}

class ItemDictionary<K: Hashable,V> {
    fileprivate var itemKeys: [K] = []
    fileprivate var itemDict: [K:V] = [:]
    var delegate: ItemArrayDelegate?
    var identifier: String = ""
    // Read-only properties
    var count: Int { self.itemKeys.count }
    var array: [V] { Array(self.itemDict.values) }
    var dictionary: [K:V] { self.itemDict }
    var keys: [K] { self.itemKeys }
    var values: [V] { Array(self.itemDict.values) }
    

    
    // -------------------------------
    // func access(at index: Int) -> T
    
    public func access(at index: Int) -> V? {
        return self.access(self.itemKeys[index])
    }
    
    public func access(_ key: K) -> V? {
        return self.itemDict[key]
    }
    

    // -------------------------------
    // func append(_ item: T)
    
    public func append(_ item: (K,V), callingDelegate callDelegate: Bool = true) {
        self.append(key: item.0, value: item.1, callingDelegate: callDelegate)
    }
    
    public func append(key: K, value: V, callingDelegate callDelegate: Bool = true) {
        self.itemKeys.append(key)
        self.itemDict[key] = value
        if callDelegate { self.delegate?.collectionChanged(self.identifier) }
    }
    
    
    // -------------------------------
    // func assign(_ items: [T])
    
    public func assign(_ items: [(K,V)]) {
        self.removeAll(keepingCapacity: true, callingDelegate: false)
        for item in items {
            self.append(item, callingDelegate: false)
        }
        self.delegate?.collectionChanged(self.identifier)
    }
    
    
    // -------------------------------
    // func insert(_ item: T, at index: Int)
    
    public func insert(_ item: (K,V), at index: Int ) {
        self.insert(key: item.0, value: item.1, at: index)
    }
    
    public func insert(key: K, value: V, at index: Int ) {
        self.itemKeys.insert(key, at: index)
        self.itemDict[key] = value
        self.delegate?.collectionChanged(self.identifier)
    }
    
    
    // -------------------------------
    // func remove(at index: Int) -> T
    
    @discardableResult
    public func remove(at index: Int, callingDelegate callDelegate: Bool = true) -> (K,V?)? {
        if index < 0 || index >= self.itemKeys.count { return nil }
        let key = self.itemKeys.remove(at: index)
        let value = self.itemDict.removeValue(forKey: key)
        if callDelegate { self.delegate?.collectionChanged(self.identifier) }
        return (key, value)
    }
    
    @discardableResult
    public func removeValue(forKey key: K) -> (K,V?)?  {
        if let index = self.index(forKey: key) {
            return self.remove(at: index)
        }
        return nil
    }
    
    
    // -------------------------------
    // func removeAll(keepingCapacity keepCapacity: Bool = false)
    
    public func removeAll(keepingCapacity keepCapacity: Bool = false) {
        self.removeAll(keepingCapacity: false, callingDelegate: true)
    }
    
    fileprivate func removeAll(keepingCapacity keepCapacity: Bool, callingDelegate callDelegate: Bool) {
        self.itemKeys.removeAll(keepingCapacity: keepCapacity)
        self.itemDict.removeAll(keepingCapacity: keepCapacity)
        if callDelegate { self.delegate?.collectionChanged(self.identifier) }
    }
    
    // -------------------------------
    // func update(at index: Int, with item: T)
    
    public func update(at index: Int, with item: (K,V) ) {
        if self.remove(at: index, callingDelegate: false) != nil {
            self.insert(item, at: index)
        }
    }
    
    public func update(at index: Int, withKey key: K, andValue value: V) {
        self.update(at: index, with: (key,value) )
    }

    // -------------------------------
    
    public func index(forKey key: K) -> Int? {
        return self.itemKeys.firstIndex(of: key)
    }
    
}
