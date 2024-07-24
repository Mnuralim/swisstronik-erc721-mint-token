// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TestNFT is ERC721 {
    uint256 private _currentTokenId = 0;

    event NFTMinted(address recipient, uint256 tokenId);

    constructor() ERC721("IzzyNFT", "IZZNFT") {}

    function mintNFT(address recipient) public returns (uint256) {
        _currentTokenId += 1;
        uint256 newItemId = _currentTokenId;
        _mint(recipient, newItemId);
        
        emit NFTMinted(recipient, newItemId);  

        return newItemId;
    }

    function burnNFT(uint256 tokenId) public {
        _burn(tokenId);
    }
}
