const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log(`Deploying contracts with the account: ${deployer.address}`);

  const NEFTOpensea = await hre.ethers.getContractFactory("NFTOpensea");
  const fundManager = await NEFTOpensea.deploy();
  await fundManager.waitForDeployment();

  console.log(`NFTOpensea deployed at: ${fundManager.target}`);
  
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
