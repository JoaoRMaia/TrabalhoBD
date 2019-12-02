module.exports = {
    getHomePage: (req, res) => {
        let query = "SELECT * FROM Senador ORDER BY ID ASC"; 

        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }

        let query = "SELECT Fornecedor, SUM(Reembolso) FROM CEAPS INNER JOIN Senador ON Sen_ID=Senador.ID GROUP BY Fornecedor ;"
                db.query(query, (err, result2) => {
            if (err) {
                res.redirect('/');
            }
            
             res.render("index.ejs", {
                title: "Trabalho Banco de Dados"
                ,senadores: result
                ,fornecedor: result2
            });
        });
        });
    },
};
