module.exports = {
    getHomePage: (req, res) => {
        let query = "SELECT * FROM Senador ORDER BY ID ASC"; 

        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }

        let query = "SELECT Fornecedor, SUM(Reembolso) as 'a' FROM CEAPS INNER JOIN Senador ON Sen_ID=Senador.ID GROUP BY Fornecedor LIMIT 10;"
                db.query(query, (err, result2) => {
            if (err) {
                res.redirect('/');
            }
        let query = "SELECT Partido, Sum(Valor) as 'a' FROM Senador INNER JOIN Recebe ON Recebe.fk_Sen_ID = Senador.ID INNER JOIN Beneficio ON Recebe.fk_Beneficio_Id = Beneficio.ID Group By Partido;"
            db.query(query, (err, result3) => {
            if (err) {
            res.redirect('/');
        }
        let query = "select mes, sum(reembolso) as 'a' from ceaps where ano = '2019' group by mes ;"
        db.query(query, (err, result4) => {
        if (err) {
        res.redirect('/');
    }
        
                
             res.render("index.ejs", {
                title: "Trabalho Banco de Dados"
                ,senadores: result
                ,fornecedores: result2
                ,partidos: result3
                ,ceaps: result4
            });
        });
    });
        });
        });
    },
};
