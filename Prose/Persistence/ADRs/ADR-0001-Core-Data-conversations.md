# ADR #0001 – Link messages to a `Conversation` Core Data entity

## Problem: The unread screen

- Filter on `isRead`
- Group by conversation
  - DM from user1@domain.com (to me@domain.com) -> Conversation ID = from = user1@domain.com
  - DM (from me@domain.com) to user1@domain.com -> Conversation ID = to = user1@domain.com
    - This case should not happen since our own messages are always read,
      BUT we might implement a "mark unread from here" functionnality,
      which would cause our own messages to appear in this section.
  - Message from user1@domain.com to myroom@domain.com -> Conversation ID = to = myroom@domain.com

## Ideas

- If we group by `from`, we don't see group chats and we see messages as DMs.
- If we group by `to`, we see all DMs in the same section.

## Envisioned solutions

- Add a `isDM` field in `Message`
  - This makes would not allow mutli
- Store the logged in user JID in Core Data, and create a "Fetched Property" which computes `isDM`
  - Same as `isDM`, but worse because it increases computations
- Choose the "Group by property" using the logged in user ID
  - Something like
    
    ```swift
    public func conversationJID(loggedInUser userJid: String) -> String {
        if self.to == userJid {
            return self.from!.jid!
        } else {
            return self.to!
        }
    }
    ```
  - The problem is that "section identifiers" have to be expressed as `KeyPath`s
- Create the "section identifier" by joining `from` and `to`, sorted
  - For example, a message from user1@domain.com to user2@domain.com could produce the identifier
    `"user1@domain.com|user2@domain.com"`,
    and a message from user2@domain.com to user1@domain.com could produce the identifier
    `"user1@domain.com|user2@domain.com"` too.
    This would allow grouping, but computations to sort the values

## Chosen solution


