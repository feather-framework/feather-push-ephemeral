//
//  MemoryPushComponentDriver.swift
//  FeatherPushDriverMemory
//
//  Created by Tibor Bodecs on 2020. 04. 28..
//

import FeatherComponent

struct MemoryPushComponentFactory: ComponentFactory {

    func build(using config: ComponentConfig) throws -> Component {
        MemoryPushComponent(config: config)
    }
}
