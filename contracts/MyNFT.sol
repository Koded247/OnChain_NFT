// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";


contract MyNFT is ERC721, Ownable {
    uint256 tokenCount;

    constructor() ERC721("KODED NFT", "KDNFT") Ownable(msg.sender) {
        tokenCount = 1;
    }

    function createNFT() public onlyOwner returns (uint256) {
        uint256 newTokenId = tokenCount;
        _safeMint(msg.sender, newTokenId);
        tokenCount += 1;
        return newTokenId;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(tokenId > 0, "URI query for nonexistent token");

    
        string memory json = Base64.encode(bytes(string(abi.encodePacked(
            '{"name": "KODED NFT--', Strings.toString(tokenId), '",',
            '"description": "This is a Token for the Brave and Confident",',
            '"image": "data:image/svg+xml;base64,', Base64.encode(bytes(generateSVG(tokenId))), '"}'
        ))));
        return string(abi.encodePacked("data:application/json;base64,", json));
    }

   function generateSVG(uint256 n) internal pure returns (string memory) {
    uint256 r1 = 147; 
    uint256 g1 = 112;
    uint256 b1 = 219;

    uint256 r2 = 34;  
    uint256 g2 = 139;
    uint256 b2 = 34;

    return string(abi.encodePacked(
        "<svg width='300' height='300' xmlns='http://www.w3.org/2000/svg'>",
        "<style> text {paint-order: stroke; stroke: blue; stroke-width: 2px; fill: white; text-anchor: middle; dominant-baseline: central;}</style>",
        "<defs><linearGradient id='gradient' x1='0%' x2='100%' y1='0%' y2='0%'>",
        "<stop offset='0%' style='stop-color:rgb(", Strings.toString(r1), ",", Strings.toString(g1), ",", Strings.toString(b1), ")' />",
        "<stop offset='100%' style='stop-color:rgb(", Strings.toString(r2), ",", Strings.toString(g2), ",", Strings.toString(b2), ")' />",
        "</linearGradient></defs>",
        "<rect width='100%' height='100%' fill='url(#gradient)' />",
        "<text x='150' y='150' font-family='Arial' font-size='32' font-weight='bold'>KodeDApp</text>",
        "</svg>"
    ));
}
}






