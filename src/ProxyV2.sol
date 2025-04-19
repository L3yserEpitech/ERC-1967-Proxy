// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

contract ProxyV2 {
    
    bytes32 private constant IMPLEMENTATION_SLOT = bytes32(uint256(keccak256("eip1967.proxy.implementation")) - 1);

    constructor(address _implem) {
        setImplementation(_implem);
    }

    fallback() external payable {
        address impl = getImplementation();
        (bool success, bytes memory returnData) = impl.delegatecall(msg.data);
        if (!success) {
            if (returnData.length > 0) {
                assembly {
                    let returndata_size := mload(returnData)
                    revert(add(32, returnData), returndata_size)
                }
            } else {
                revert("Delegatecall failed without reason");
            }
        }
        assembly {
            return(add(returnData, 32), mload(returnData))
        }
    }

    function getImplementation() public view returns (address impl) {
        bytes32 slot = IMPLEMENTATION_SLOT;
        assembly {
            impl := sload(slot)
        }
        return impl;
    }

    function _setImplementation(address newImplementation) internal {
        bytes32 slot = IMPLEMENTATION_SLOT;
        assembly {
            sstore(slot, newImplementation)
        }
    }

    function setImplementation(address newImplementation) virtual public {
        _setImplementation(newImplementation);
    }

    receive() external payable {}
}