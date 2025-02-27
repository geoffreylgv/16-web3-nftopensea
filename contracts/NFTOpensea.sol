// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFTOpensea is ERC721URIStorage {
    uint256 private _nextTokenId;

    constructor() ERC721("NFTOpensea", "JAY") {}

    function mint() public {
        uint256 tokenId = _nextTokenId;
        _safeMint(msg.sender, tokenId);
        _nextTokenId++;
    }

    function tokenURI(uint256 tokenId) public pure override returns (string memory) {
        string memory svg = generateSVG();
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name":"Onchain NFT #',
                        Strings.toString(tokenId),
                        '", "description":"A1 J1 : An on-chain SVG NFT from JAY.", "image":"data:image/svg+xml;base64,',
                        Base64.encode(bytes(svg)),
                        '"}'
                    )
                )
            )
        );

        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    function generateSVG() internal pure returns (string memory) {
        
        string memory IMG = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">'
            '<rect width="200" height="200" fill="#fefefe"/>'
            '<circle cx="100" cy="100" r="20" fill="#ff4500"/>'
            '<text x="50%" y="50%" font-family="Arial" font-size="20" fill="#fff" text-anchor="middle" dy=".3em">JAY</text>'
            '</svg>';

        return IMG;
    }
}
