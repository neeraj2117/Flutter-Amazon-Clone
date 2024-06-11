const mongoose = require("mongoose");
const express = require("express");
const app = express();

const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
const PORT = 3000;
const DB = "mongodb+srv://royalnanu21:M0aGQHPK81l8laGj@flutteramazonclone.brvyxoz.mongodb.net/?retryWrites=true&w=majority&appName=FlutterAmazonClone";

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

mongoose.connect(DB).then(() => {
    console.log('DB connected');
}).catch((e) => {console.log(e)});


app.get('/hello-world', (req, res) => {
    res.send('Hello World');
});

app.listen(PORT, () => {
    console.log(`Server is running on : ${PORT}`);
});


