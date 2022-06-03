//
//  StorageProvider+Preview.swift
//  Persistence
//
//  Created by Rémi Bardon on 27/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

import OSLog

extension StorageProvider {
    
    public static var preview: StorageProvider {
        let provider = StorageProvider(storeType: .inMemory)
        let viewContext = provider.container.viewContext
        
        let alexandre = provider.alexandre()
        let antoine = provider.antoine()
        let baptiste = provider.baptiste()
        _ = provider.camille()
        _ = provider.constellationHealth()
        _ = provider.eliott()
        let julien = provider.julien()
        let valerian = provider.valerian()
        
        // Test messages
        _ = (1...21).map {
            let message = MessageEntity(context: viewContext)
            message.from = valerian
            message.to = baptiste
            message.content = "Hello from Valerian \($0)!"
            message.timestamp = .now - Double($0) * 1_000
            message.isRead = true
        }
        _ = (1...10).map {
            let message = MessageEntity(context: viewContext)
            message.from = alexandre
            message.to = baptiste
            message.content = "Hello from Alexandre \($0) 👋"
            message.timestamp = .now - Double($0) * 1_000
            message.isRead = true
        }
        _ = (1...21)
            .map { (n: Int) -> (Int, String) in
                (n, (["A"] + Array(repeating: "long", count: (n - 1) * 4) + ["message."])
                    .joined(separator: " "))
            }
            .map {
                let message = MessageEntity(context: viewContext)
                message.from = antoine
                message.to = baptiste
                message.content = $0.1
                message.timestamp = .now - Double($0.0) * 10_000
                message.isRead = true
            }
        
        // Unread messages
        do {
            let message = MessageEntity(context: provider.container.viewContext)
            message.from = baptiste
            message.to = valerian
            message.content = "They forgot to ship the package."
            message.timestamp = .now - 2_800
            message.isRead = false
        }
        do {
            let message = MessageEntity(context: provider.container.viewContext)
            message.from = valerian
            message.to = baptiste
            message.content = "Okay, I see. Thanks. I will contact them whenever they get back online. 🤯"
            message.timestamp = .now - 3_000
            message.isRead = false
        }
        do {
            let message = MessageEntity(context: provider.container.viewContext)
            message.from = baptiste
            message.to = julien
            message.content = "Can I initiate a deployment of the Vue app?"
            message.timestamp = .now - 9_000
            message.isRead = false
        }
        do {
            let message = MessageEntity(context: provider.container.viewContext)
            message.from = julien
            message.to = baptiste
            message.content = "Yes, it's ready. 3 new features are shipping! 😀"
            message.timestamp = .now - 10_000
            message.isRead = false
        }
//      (ChatID.group(id: "constellation"), [
//        Message(
//            fromId: PreviewJIDs.baptiste.rawValue,
//            content: "⚠️ I'm performing a change of the server IP definitions. Slight outage espected.",
//            timestamp: Date() - 90_000
//        ),
//        Message(
//            fromId: PreviewJIDs.constellationHealth.rawValue,
//            content: "🆘 socket-1.sgp.atlas.net.crisp.chat - Got HTTP status: \"503 or invalid body\"",
//            timestamp: Date() - 100_000
//        ),
//      ])
        
        do {
            try viewContext.save()
            Logger.persistence.info("Successfully created preview entities")
        } catch {
            Logger.persistence.error("Error creating preview entities: \(String(describing: error))")
        }
        
        return provider
    }
    
    func alexandre() -> UserEntity {
        let user = UserEntity(context: self.container.viewContext)
        
        user.jid = PreviewJIDs.alexandre.rawValue
        user.displayName = "Alexandre"
        user.fullName = "Alexandre"
        user.avatar = PreviewImages.Avatars.alexandre.rawValue
        
        return user
    }
    
    func antoine() -> UserEntity {
        let user = UserEntity(context: self.container.viewContext)
        
        user.jid = PreviewJIDs.antoine.rawValue
        user.displayName = "Antoine"
        user.fullName = "Antoine"
        user.avatar = PreviewImages.Avatars.antoine.rawValue
        
        return user
    }
    
    func baptiste() -> UserEntity {
        let user = UserEntity(context: self.container.viewContext)
        
        user.jid = PreviewJIDs.baptiste.rawValue
        user.displayName = "Baptiste"
        user.fullName = "Baptiste Jamin"
        user.avatar = PreviewImages.Avatars.baptiste.rawValue
        
        return user
    }
    
    func camille() -> UserEntity {
        let user = UserEntity(context: self.container.viewContext)
        
        user.jid = PreviewJIDs.camille.rawValue
        user.displayName = "Camille"
        user.fullName = "Camille"
        user.avatar = PreviewImages.Avatars.camille.rawValue
        
        return user
    }
    
    func constellationHealth() -> UserEntity {
        let user = UserEntity(context: self.container.viewContext)
        
        user.jid = PreviewJIDs.constellationHealth.rawValue
        user.displayName = "constellation-health"
        user.fullName = "constellation-health"
        user.avatar = PreviewImages.Avatars.constellationHealth.rawValue
        
        return user
    }
    
    func eliott() -> UserEntity {
        let user = UserEntity(context: self.container.viewContext)
        
        user.jid = PreviewJIDs.eliott.rawValue
        user.displayName = "Eliott"
        user.fullName = "Eliott"
        user.avatar = PreviewImages.Avatars.eliott.rawValue
        
        return user
    }
    
    func julien() -> UserEntity {
        let user = UserEntity(context: self.container.viewContext)
        
        user.jid = PreviewJIDs.julien.rawValue
        user.displayName = "Julien"
        user.fullName = "Julien Le Coupanec"
        user.avatar = PreviewImages.Avatars.julien.rawValue
        
        return user
    }
    
    func valerian() -> UserEntity {
        let user = UserEntity(context: self.container.viewContext)
        
        user.jid = PreviewJIDs.valerian.rawValue
        user.displayName = "Valerian"
        user.fullName = "Valerian Saliou"
        user.avatar = PreviewImages.Avatars.valerian.rawValue
        
        return user
    }
    
}
