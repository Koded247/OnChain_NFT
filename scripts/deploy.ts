// scripts/deploy.ts
import { ethers } from "hardhat";
import { Contract } from "ethers";

async function main() {
  // Get the deployer's signer (updated for ethers v6 compatibility)
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with account:", deployer.address);



  // Get the contract factory
  const MyNFTFactory = await ethers.getContractFactory("MyNFT");

  // Deploy the contract
  console.log("Deploying MyNFT...");
  const myNFT: Contract = await MyNFTFactory.connect(deployer).deploy();
  
  // Wait for the deployment transaction to be mined
  await myNFT.deployed();

  // Log the contract address
  console.log("MyNFT deployed to:", myNFT.address);

  // Verify the deployment by checking the owner
  const owner = await myNFT.owner();
  console.log("Contract owner:", owner);
}

// Execute the deployment and handle errors
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Deployment failed:", error);
    process.exit(1);
  });