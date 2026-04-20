import express from 'express';

const app = express();

const porta = process.env.PORT || 8080;
const message = process.env.MESSAGE || 'Hello, World!';

app.get('/', (req, res) => {
  res.send(message);
});



app.listen(porta, () => {
  console.log(`Server is running on port ${porta}`);
});