const express = require("express");
const app = express();

app.get("/", (req, res) => {
	  res.send("Hello World --> v2 deployed");
});

app.listen(3000, () => {
	  console.log("Express app running on port 3000");
});

