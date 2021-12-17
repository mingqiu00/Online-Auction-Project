import express from "express";
import moment from "moment";
import multer from "multer";

import productModel from "../models/product.model.js";
import categoryModel from "../models/category.model.js";

const router = express.Router();

router.get('/', function (req, res) {
    res.redirect('/seller/product/list/active');
})

router.get('/product/list/active', async function(req, res) {
    const limit = 5;
    const page = req.query.page || 1;
    const offset = (page - 1) * limit;

    const total = await productModel.countAllActive();
    let numPages = Math.floor(total/limit);
    if (total % limit > 0) numPages++;

    const pageNumbers = [];
    for (let i = 1; i <= numPages; i++) {
        pageNumbers.push({
           value: i,
            isCurrent: +page === i,
        });
    }

    const productList = await productModel.findActivePage(limit, offset);
    productList.forEach(async (product) => {
        const cat = await categoryModel.findByPro(product.ProID);
        product.CatName = cat[0].CatName;
        const highestBid = await productModel.findHighestBID(product.ProID);
        if (highestBid === null) {
            product.HighestBid = "None";
        }
        else {
            product.HighestBid = highestBid.Price;
        }
        product.UploadDate = moment(product.UploadDate).format("DD/MM/YYYY HH:mm:ss");
        product.EndDate = moment(product.EndDate).format("DD/MM/YYYY HH:mm:ss");
    })
    res.render('vwSeller/active', {
        layout: 'seller',
        products: productList,
        pageNumbers
    });
})

router.get('/product/list/sold', async function (req, res) {
    const limit = 5;
    const page = req.query.page || 1;
    const offset = (page - 1) * limit;

    const total = await productModel.countAll();
    let numPages = Math.floor(total/limit);
    if (total % limit > 0) numPages++;

    const pageNumbers = [];
    for (let i = 1; i <= numPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: +page === i,
        });
    }

    const productList = await productModel.findPage(limit, offset);
    productList.forEach(async (product) => {
        const cat = await categoryModel.findByPro(product.ProID);
        product.CatName = cat[0].CatName;
        product.UploadDate = moment(product.UploadDate).format("DD/MM/YYYY HH:mm:ss");
        product.EndDate = moment(product.EndDate).format("DD/MM/YYYY HH:mm:ss");
    })
    res.render('vwSeller/sold', {
        layout: 'seller',
        products: productList,
        pageNumbers
    });
})

router.post('/product/delete', async function (req, res) {
    await productModel.del(req.body.id);
    res.redirect('/seller/product/list/sold');
})

router.post('/product/edit', function(req, res) {

})

router.get('/product/edit', async function (req, res) {
    const ProID = req.query.id || 0;
    const product = await productModel.findById(ProID);
    res.render('vwSeller/edit', {
        layout: 'seller',
        product: product[0],
        empty: product.length === 0
    });
})

router.post('/product/add',async function(req, res) {
    const maxProID = await productModel.findLastProID();
    const newProID = +maxProID + 1;
    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, './public/imgs/sp/' + newProID);
        },
        filename: function (req, file, cb) {
            if (file.fieldname === 'thumbnail') {
                cb(null, 'main_thumbs.jpg');
            }
            if (file.fieldname === 'subImages') {
                cb(null, file.fieldname + '-' + Date.now() + '.jpg');
            }
        }
    })
    const upload = multer({ storage: storage });
    upload.fields([{name: 'thumbnail', maxCount: 1}, {name: 'subImages', maxCount: 5}]) (req, res, async function(err) {
        const product = req.body;
        product.CatID = await categoryModel.findByCatName(product.CatName);
        product.ProID = newProID;
        delete product.CatName;

        await productModel.addProduct(product);
        if(err) {
            console.log(err);
        }
        else {
            res.redirect('/seller/product/list/active');
        }
    })
})

router.get('/product/add', async function(req, res) {
    const catList = await categoryModel.findAllSubCat();
    res.render('vwSeller/add', {
        layout: 'seller',
        catList: catList
    });
})

export default router;