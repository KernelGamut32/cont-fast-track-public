 var express = require('express');
 var router = express.Router();
 var DataBaseHandler = require("../config/DataBaseHandler");
 var dataBaseHandler = new DataBaseHandler();
 
 var connection = dataBaseHandler.createConnection();
 
 router.get('/', function (req, res, next) {
     connection.query('SELECT * FROM BENEFIT ORDER BY Code;', function (error, result, fields) {
         if (error) throw error;
 
         if(result[0].length== 0){
             res.status(404).send({
                 status : "ERROR",
                 message: "No existe usuario en Base de Datos"
             });
         }else{
             res.status(202).send({
                 status : "SUCCESS",
                 message: "Benefits found",
                 data : result
             });
         }
     });
 });
 
 module.exports = router;