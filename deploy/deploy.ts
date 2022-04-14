import { utils, Wallet } from "zksync-web3";
import * as ethers from "ethers";
import { HardhatRuntimeEnvironment } from "hardhat/types";
import { Deployer } from "@matterlabs/hardhat-zksync-deploy";
import * as dotenv from 'dotenv';

// ******** Add your values below ********
const privateKey = "<YOUR-PRIVATE-KEY>";
const contractName = "<YOUR-CONTRACT-NAME>";

// An example of a deploy script that will deploy and call a simple contract.
export default async function (hre: HardhatRuntimeEnvironment) {
  console.log(`Running deploy script for the library...`);

  // Initialize the wallet.
  const wallet = new Wallet(privateKey);

  // Create deployer object and load the artifact of the contract we want to deploy.
  const deployer = new Deployer(hre, wallet);
  const artifact = await deployer.loadArtifact(contractName);

  // Deposit some funds to L2 in order to be able to perform L2 transactions.
  const depositAmount = ethers.utils.parseEther("0.001");
  const depositHandle = await deployer.zkWallet.deposit({
    to: deployer.zkWallet.address,
    token: utils.ETH_ADDRESS,
    amount: depositAmount,
  });

  // Wait until the deposit is processed on zkSync
  await depositHandle.wait();

  const contract = await deployer.deploy(artifact,[]);

  // Show the contract info.
  const contractAddress = contract.address;
  console.log(`${artifact.contractName} was deployed to ${contractAddress}`);
}