# ERC-1967 Proxy Workshop

A hands-on workshop to understand and implement upgradeable smart contracts using the ERC-1967 proxy pattern.

## How does it work?

This project demonstrates the implementation of upgradeable smart contracts using the proxy pattern:

1. **Separation of Concerns**: The proxy contract stores state while implementation contracts contain logic
2. **Delegation Mechanism**: The proxy uses `delegatecall` to execute logic from the implementation while maintaining its own state
3. **Upgradability**: The implementation address can be changed to point to new logic without losing state or changing the contract address

The repository features multiple implementations:
- `ProxyV1`: A simple proxy with direct storage
- `ProxyV2`: An ERC-1967 compliant proxy with optimized storage slots

## Getting Started

### Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/ERC-1967-proxy.git
cd ERC-1967-proxy
```

2. Install Foundry:
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Quickstart

Build the project:
```bash
forge build
```

Run the tests:
```bash
forge test -vvv
```

### Usage

#### Exploring the Code

1. Examine the proxy implementations in the `src/` directory:
   - `ProxyV1.sol`: Basic proxy implementation
   - `ProxyV2.sol`: ERC-1967 compliant implementation

2. Look at test implementations in the `test/` directory:
   - `CounterV1.sol` & `CounterV2.sol`: Sample implementations
   - `ProxyV1.t.sol` & `ProxyV2.t.sol`: Tests demonstrating proxy behavior and upgrades


## Get involved

You're invited to join this project! Check out the [contributing guide](./CONTRIBUTING.md).

If you're interested in how the project is organized at a higher level, please contact the current project manager.

## Our PoC team ❤️

Developers
| [<img src="https://avatars.githubusercontent.com/u/146731380?v=4" width=85><br><sub>Jules Lordet</sub>](https://github.com/L3yserEpitech) |
| :---: |

<h2 align=center>
Organization
</h2>

<p align='center'>
    <a href="https://www.linkedin.com/company/pocinnovation/mycompany/">
        <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn logo">
    </a>
    <a href="https://www.instagram.com/pocinnovation/">
        <img src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white" alt="Instagram logo"
>
    </a>
    <a href="https://twitter.com/PoCInnovation">
        <img src="https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white" alt="Twitter logo">
    </a>
    <a href="https://discord.com/invite/Yqq2ADGDS7">
        <img src="https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white" alt="Discord logo">
    </a>
</p>
<p align=center>
    <a href="https://www.poc-innovation.fr/">
        <img src="https://img.shields.io/badge/WebSite-1a2b6d?style=for-the-badge&logo=GitHub Sponsors&logoColor=white" alt="Website logo">
    </a>
</p>

> 🚀 Don't hesitate to follow us on our different networks, and put a star 🌟 on `PoC's` repositories

> Made with ❤️ by PoC
