import express from "express";
import productModel from "../models/product.model.js";

const router = express.Router();

router.get('/detail', (req, res) => {
    res.render('vwProduct/detail', {layout: 'main'})
})

router.get('/:id', async (req, res) => {
    const id = req.params.id;
    const obj = await productModel.findById(id);
    console.log(obj)
    res.render('vwProduct/detail', {
        layout: 'main',
        product : obj[0]
    })
})


export default router;