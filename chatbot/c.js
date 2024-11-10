const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { Configuration, OpenAIApi } = require("openai");

const app = express();
const port = 3000;

// Middleware to parse JSON
app.use(bodyParser.json());
app.use(cors());  // Enable CORS for all routes
app.use(express.static('public')); // Serve static files (HTML, JS)

// Initialize OpenAI API with your API key
const configuration = new Configuration({
    apiKey: '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' // Replace with your actual OpenAI API key
});
const openai = new OpenAIApi(configuration);

// Route to handle chatbot message
app.post('/ask-chatbot', async (req, res) => {
    const userMessage = req.body.userMessage;

    if (!userMessage) {
        return res.status(400).json({ error: "User message is required" });
    }

    try {
        const response = await openai.createChatCompletion({
            model: "text-davinci-003",
            messages: [{ role: "user", content: userMessage }],
        });

        const botMessage = response.data.choices[0].message.content;
        res.json({ botMessage: botMessage });

    } catch (error) {
        console.error('Error interacting with OpenAI API:', error.message);
        res.status(500).json({ error: 'Error processing your request. Please try again later.' });
    }
});

// Start the server and listen on the defined port
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
