// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Address {
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

//better
contract TestAddress {
    address payable public adda;
    uint256 public ba;
    constructor() {
        uint256 id;
        assembly {
            id := chainid()
        }
        ba = id+1;
    }
    function isContractOrNot (address testAddr) public view returns (bool) {
        //ba = adda.balance;
        //adda.transfer(100);
        return Address.isContract(testAddr);
    }

    function getChainID() external view returns (uint256) {
        uint256 id;
        assembly {
            id := chainid()
        }
        return id;
    }

    function getBlockChainID() external view returns (uint256) {
        uint256 id = block.chainid;
        return id;
    }
    function weicaozuo(bytes32 indata, uint256 zuo, uint256 you, uint256 index) external pure returns (bytes32, bytes1) {
        bytes32 outdata = indata<<zuo;
        outdata = outdata>>you;
        bytes1 outIndexData = outdata[index];
        return (outdata, outIndexData);
    }
    function xiaoshu() external pure returns (uint256, uint256) {
        uint256 a = 3;
        uint256 b = 0.5 + 2.5 + a;
        return (.1 / 3 * 3000, b);
    }
}
