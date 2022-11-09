const { ethers } = require("hardhat");

async function main() {
  let maxWhitelistedAddresses = 10;
  const whitelistContract = await ethers.getContractFactory("Whitelist"); // get Whitelist.sol
  
  const deployedWhitelistContract = await whitelistContract.deploy(maxWhitelistedAddresses); 
  await deployedWhitelistContract.deployed();

  console.log("Whitelist Contract Address:", deployedWhitelistContract.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });