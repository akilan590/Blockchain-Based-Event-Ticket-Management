# Blockchain-Based-Event-Ticket-Management
A Solidity smart contract for managing event ticketing on Ethereum. Organizers can create events, users can buy tickets with ETH, and transfer tickets securely. Built for simple, decentralized ticket sales and transfers.

# 🎫 EventContract — Decentralized Ticketing on Ethereum

Welcome to **EventContract**, a smart contract built with Solidity that brings event ticketing to the blockchain. Say goodbye to scalpers and fraud — this contract empowers event organizers to create events, sell tickets transparently, and lets attendees securely buy and transfer tickets using ETH.

---

## 🚀 Why EventContract?

Traditional ticketing platforms often come with high fees, central points of failure, and limited transparency. With EventContract:

- **Organizers** can effortlessly launch new events with customizable details.
- **Buyers** pay directly with ETH for tickets, no middlemen involved.
- **Ticket transfers** happen peer-to-peer on-chain, securely and instantly.
- **Immutable records** guarantee fair ownership and reduce fraud.

---

## 📦 Features

- Create and manage multiple events with unique IDs
- Specify event details: name, date, ticket price, and supply
- Buy tickets by sending ETH matching the ticket price
- Transfer tickets to other users before the event date
- Prevent ticket purchases or transfers after event completion

---

## 🛠 How It Works

1. **Create Event** — Organizer calls `createEvent()` with event info and ticket supply.
2. **Buy Tickets** — Users call `buyTicket()`, paying the exact price per ticket.
3. **Transfer Tickets** — Ticket holders use `transferTicket()` to gift or sell tickets.
4. **Check Tickets** — Use the public mappings to verify ticket ownership anytime.

---

## ⚙️ Usage Example

```solidity
// Organizer creates a new event (future timestamp, price in wei, ticket count)
createEvent("Music Festival", block.timestamp + 86400, 0.05 ether, 100);

// User buys 3 tickets (send 0.15 ETH)
buyTicket(0, 3);

// User transfers 1 ticket to a friend
transferTicket(0, 1, 0xFriendAddress);

