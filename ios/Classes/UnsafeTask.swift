//
//  UnsafeTask.swift
//  apphud
//
//  Created by Nikolay Ivanov on 01.12.2023.
//

class UnsafeTask<T> {
    let semaphore = DispatchSemaphore(value: 0)
    private var result: T?
    init(block: @escaping () async throws -> T){
        Task {
            result = try await block()
            semaphore.signal()
        }
    }

    func get() -> T {
        if let result = result { return result }
        semaphore.wait()
        return result!
    }
}
