const express = require('express');
const hbs = require('hbs');
const wax = require('wax-on');
const mysql2 = require('mysql2/promise');
const { createConnection } = require('mysql2');
require('dotenv').config();

const app = express();

// set up view engine
app.set('view engine', 'hbs');

// enable static files
app.use(express.static('public'));

// wax-on (template inheritance)
wax.on(hbs.handlebars);
wax.setLayoutPath('./views/layouts');

async function main(){
    const connection = await createConnection({
        'host': process.env.DB_HOST,
        'user': process.env.DB_USER,
        'database': process.env.DB_DATABASE,
        'password': process.env.DB_PASSWORD
    })

    app.get('/customers', async (req, res) => {
        // the [] means array destructuring
        let [customers] = await connection.execute('SELECT * FROM Customers');
        // is the same as
        // let customers = await connection.execute("SELECT * FROM Customers")[0];
        res.render('customers/index', {
            'customers': customers
        })
    })

    app.listen(3000, () => {
        console.log('server has started')
    })
}

main()


