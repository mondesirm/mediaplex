const cors = require('cors');
const express = require('express');
const app = express();

const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJIcml0aWsiLCJuYW1lIjoiWW91d2lsbG5ldmVyZ2V0aXQiLCJpYXQiOjE1MTYyMzkwMjJ9.6PRPWzmu_or76BASRLuP59ALvgWdQ8viGM9aThRojyY';

app.use(cors());
app.use(express.json());

const animeList = require('./routers/anime_list');
const trendingList = require('./routers/trending');
const comming_soon = require('./routers/comming_soon');
const actionMovies = require('./routers/action_movie');
const actionSeries = require('./routers/action_series');
const horrorMovies = require('./routers/horror_movies');
const horrorSeries = require('./routers/horror_series');
const newArrivalsList = require('./routers/new_arrivals');
const featuredBanner = require('./routers/featuredBanner');
const AnimatedMovies = require('./routers/Animated_movies');
const animatedSeries = require('./routers/animated_series');
const indianChannelList = require('./routers/indian_channel_list');

app.use('/animeList', authorization, animeList);
app.use('/indianChannelList', authorization, indianChannelList);

// Home page
app.use('/commingsoon', authorization, comming_soon);
app.use('/trendingList', authorization, trendingList);
app.use('/newarrivals', authorization, newArrivalsList);
app.use('/featuredBanner', authorization, featuredBanner);

// Movie categories
app.use('/actionMovies', authorization, actionMovies);
app.use('/horrorMovies', authorization, horrorMovies);
app.use('/animatedMovies', authorization, AnimatedMovies);

// Series categories
app.use('/actionSeries', authorization, actionSeries);
app.use('/horrorSeries', authorization, horrorSeries);
app.use('/animatedSeries', authorization, animatedSeries);

// Starting route
app.get('/', authorization, (req, res) => {
    if (req.Auth) res.send("Server Connected");
    else res.send('Auth fail');
});

// Authorization
function authorization (req, res, next){
    const authHeader = req.headers['authorization'];
    const reqtoken = authHeader && authHeader.split(' ')[1];
    if (reqtoken == null) req.Auth = false;

    if (reqtoken === token) req.Auth =  true;
    else req.Auth = false;

    next();
}

const startServer = async () => {
    try {
        const PORT = process.env.PORT || 3000;
        app.listen(PORT, () => { console.log(`Server listening on port ${PORT}`) });
    } catch (error) {
        console.log(error);
    }
}

startServer();