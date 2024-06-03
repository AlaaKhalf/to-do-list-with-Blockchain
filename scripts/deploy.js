async function main() {
    const todo = await ethers.getContractFactory("todo");
  
    // Start deployment, returning a promise that resolves to a contract object
    const todo_ = await todo.deploy();
    console.log("Contract address:", todo_.address);
  
  
  }
  
  main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });