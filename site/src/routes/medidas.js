var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/Anime", function (req, res) {
    medidaController.buscarUltimasMedidasAnime(req, res);
});

router.get("/ultimas/Manga", function (req, res) {
    medidaController.buscarUltimasMedidasManga(req, res);
});

router.get("/ultimas/Terminaram", function (req, res) {
    medidaController.buscarUltimasMedidasTerminaram(req, res);
});

router.get("/ultimas/MaisVotado", function (req, res) {
    medidaController.buscarUltimasMedidasMaisVotado(req, res);
});

router.get("/ultimas/Totais", function (req, res) {
    medidaController.buscarUltimasMedidasTotais(req, res);
});

module.exports = router;