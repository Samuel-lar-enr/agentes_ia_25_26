//Fichero encargado de levantar una API REST con Express
//imports
import { config } from 'dotenv';
import express from "express";
import dataAPI from './db/db.js';
import cors from 'cors';
//cargar variables
config();

const PORT=process.env.PORT || 4000;
const NODE_ENV=process.env.NODE_ENV;
const SERVER_URL=process.env.SERVER_URL;
const HOST=process.env.HOST;

//cors voy a permitir CORS
const app = express();

app.use(cors())

//voy a permitir json como cuerpo de peticiones 
app.use(express.json());

// midleware
app.use((req,res,next) => {
    const timeData = new Date().toISOString();
    console.log(`${timeData} ${req.method} ${req.url} -IP ${req.ip}`)
    next();
})


app.get('/', (req,res)  => {
    res.json({
        message:"MIni API de productos",
        version: "1.0.0",
        endpoints: {
            "GET /productos": "Obtiene todos los productos de la api"
        }
    });
});

app.get('/productos', (req,res)  => {
    console.log("")
    res.json({
        succes:true,
        data: dataAPI,
        //para que se autoicremente: count:posts.leght
        count: dataAPI.length
    })

})

app.delete('/productos/:id', (req,res)  => {
    console.log("")
    res.json({
        succes:true,
        data: dataAPI,
        
        count: dataAPI.length
    })

})


//INICIAR SERVIDOR
app.listen(PORT, HOST, ()=> {
    console.log(`Bienvenido al servidor de productos 🧺 -----> ${SERVER_URL}:${PORT}`)
})

