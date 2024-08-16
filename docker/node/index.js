const express = require('express');
const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

// MongoDB connection
const mongoUri = process.env.MONGO_URI;

if (!mongoUri) {
    console.error('MongoDB URI is not set');
    process.exit(1);
}

mongoose.connect(mongoUri, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('MongoDB connected'))
    .catch(err => {
        console.error('MongoDB connection error:', err);
        process.exit(1);
    });

const Item = mongoose.model('Item', new mongoose.Schema({
  name: String,
  value: String
}));

// Endpoint to insert data
app.post('/data', async (req, res) => {
  try {
    const { name, value } = req.body;
    const item = new Item({ name, value });
    await item.save();
    res.status(201).send(item);
  } catch (err) {
    res.status(500).send('Error saving data');
  }
});

const exampleSchema = new Schema({
  name: String,
  age: Number
});
const Example = mongoose.model('Example', exampleSchema);

// Endpoint to retrieve data
app.get('/data/rujal1', async (req, res) => {
  try {
    const data = await Example.find();
    res.send(data);
  } catch (err) {
    res.status(500).send('Error retrieving data');
  }
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
