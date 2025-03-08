// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.28;

import "./interfaces/IERC20.sol";

contract MyERC20 is IERC20 {
    string private constant _myTokenName = "MyERC20";
    string private constant _mySymbol = "VPERC20";
    uint8 private _myDecimals = 18;
    uint256 private _myTotalSupply;

    constructor(uint256 _totalSupply) {
        _myTotalSupply = _totalSupply;
    }

    function name() public view returns (string memory) {
        return _myTokenName;
    }

    function symbol() public view returns (string memory) {
        return _mySymbol;
    }

    function decimals() public view returns (uint8) {
        return _myDecimals;
    }
}
