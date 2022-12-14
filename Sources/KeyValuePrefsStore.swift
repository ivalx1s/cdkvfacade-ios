import Foundation

public protocol KVPrefIdentifiable {
    static var key: KVEntityId { get }
}
public protocol AnyKVPref: Codable, KVPrefIdentifiable {}

public protocol KeyValuePrefsStore {
    func read<Model>(from entity: CDKeyValueEntity.Type) throws
            -> Model? where Model: AnyKVPref

    func upsert<Model>(to entity: CDKeyValueEntity.Type, _ item: Model) throws
            where Model: AnyKVPref

    func delete(by key: KVEntityId, from entity: CDKeyValueEntity.Type) throws
}
