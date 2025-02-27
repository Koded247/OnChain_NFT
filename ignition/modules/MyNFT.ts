// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";



const MyNFTModule = buildModule("MyNFTModule", (m) => {
 

  const NFT = m.contract("MyNFT");

  return { NFT };
});

export default MyNFTModule;
