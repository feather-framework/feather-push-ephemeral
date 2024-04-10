//
//  MemoryPushComponentContext.swift
//  FeatherPushDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherComponent

/// memory push component context
public struct MemoryPushComponentContext: ComponentContext {

    /// memory push component context init
    public init() {}

    /// make
    public func make() throws -> ComponentFactory {
        MemoryPushComponentFactory()
    }

}
