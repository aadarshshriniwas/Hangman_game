const express = require('express');
const fs = require('fs');
const cors = require('cors'); // Import the CORS middleware
const app = express();
const port = 3000;

// Read and parse the JSON file
const rawData = fs.readFileSync('word.json');
const wordsAndHints = JSON.parse(rawData);

// Use CORS middleware to enable CORS
app.use(cors());

// Endpoint to get a random word and hint from a specific category
app.get('/get_word/:category', (req, res) => {
    const category = req.params.category.toLowerCase();
    const filteredWords = wordsAndHints[category];

    if (!filteredWords) {
        return res.status(404).json({ error: "Category not found" });
    }

    const wordHint = filteredWords[Math.floor(Math.random() * filteredWords.length)];
    res.json(wordHint);
});

// Endpoint to get a random word and hint from any category
app.get('/get_word', (req, res) => {
    const category = req.query.category ? req.query.category.toLowerCase() : null;
    let filteredWords = [];

    if (category) {
        filteredWords = wordsAndHints[category];
        if (!filteredWords) {
            return res.status(404).json({ error: "Category not found" });
        }
    } else {
        // Combine all categories if no specific category is provided
        for (let key in wordsAndHints) {
            filteredWords = filteredWords.concat(wordsAndHints[key]);
        }
    }

    const wordHint = filteredWords[Math.floor(Math.random() * filteredWords.length)];
    res.json(wordHint);
});

app.listen(port, () => {
    console.log(`Hangman API listening at http://localhost:${port}`);
});
