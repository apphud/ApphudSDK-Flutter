//
//  UnsafeTaskNullable.swift
//  apphud
//
//  Created by Nikolay Ivanov on 28.01.2024.
//


class UnsafeTaskNullable<T> {
    let semaphore = DispatchSemaphore(value: 0)
    private var result: T?
    init(block: @escaping () async -> T?) {
        Task {
            result = await block()
            semaphore.signal()
        }
    }

    func get() -> T? {
        semaphore.wait()
        return result!
    }
}
