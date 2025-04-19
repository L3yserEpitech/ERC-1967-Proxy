// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import "./ProxyV2.sol";

contract ProxyOwnableUpgradable is ProxyV2 {

    bytes32 private constant SLOT = bytes32(uint256(keccak256("eip1967.proxy.owner")) - 1);

    constructor(address _implementation) ProxyV2(_implementation) {
        bytes32 slot = SLOT;    
        assembly {
            sstore(slot, caller())
        }
    }

    function getOwner() public view returns (address _owner) {
        bytes32 slot = SLOT;
        assembly {
            _owner := sload(slot)
        }
        return _owner;
    }

    function _setNewOwner(address newOwner) internal {
        bytes32 slot = SLOT;
        assembly {
            sstore(slot, newOwner)
        }
    }

    modifier onlyOwner() {
        require(msg.sender == getOwner(), "Caller is not the owner");
        _;
    }

    function setNewOwner(address newOwner) public onlyOwner() {
        _setNewOwner(newOwner);
    }

    event Upgraded(address indexed implementation);
    event ProxyOwnershipTransferred(address previousOwner, address newOwner);

    function transferProxyOwnership(address newOwner) public onlyOwner {
        emit ProxyOwnershipTransferred(getOwner(), newOwner);
        _setNewOwner(newOwner);
    }

    function upgradeTo(address newImplementation) public onlyOwner {
        _setImplementation(newImplementation);
        emit Upgraded(newImplementation);
    }    


}

