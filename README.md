# zkSync Library Deployment script

This project is intended to simplify the process of deploying libraries to zkSync goerli testnet to be used with larger project deployments that depend on these libraries.  Most code is taken directly from zkSync's documentation, but some modifications were made to simplify the process and ensure smooth deployment.

# This project mostly follows the documentation from https://v2-docs.zksync.io/api/hardhat/getting-started.html#initializing-the-project, zkSync's own recommendation for deploying libraries as stated here: https://v2-docs.zksync.io/api/hardhat/compiling-libraries.html#example.  See the documentation for any changes or questions.

# NOTE: this project uses typescript.  Make sure both typescript and ts-node are installed and configured correctly before attempting to deploy.

1. Install all dependencies: yarn install
2. Add any libraries and their dependant contracts to "contracts"
3. Compile contracts: yarn hardhat compile
4. Replace <YOUR-PRIVATE-KEY> with the private key of the address you plan to deploy with.
5. Replace <YOUR-CONTRACT-NAME> with the name of the library contract to deploy
6. Deploy with: yarn hardhat deploy-zksync