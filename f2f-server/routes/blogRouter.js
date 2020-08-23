const express = require("express");
// const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const authenticate = require("../authenticate");

const Blog = require("../models/blogs");

const router = express.Router();

router
    .route("/")
    .get(authenticate.verifyUser, (req, res, next) => {
        Blog.find({})
            .then(
                (blog) => {
                    res.statusCode = 200;
                    res.setHeader("Content-Type", "application/json");
                    res.json(blog);
                },
                (err) => next(err)
            )
            .catch((err) => next(err));
    })
    .post(
        authenticate.verifyUser,
        authenticate.verifyAdmin,
        (req, res, next) => {
            Blog.create(req.body)
                .then(
                    (blog) => {
                        console.log("Blog Created ", blog);
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(blog);
                    },
                    (err) => next(err)
                )
                .catch((err) => next(err));
        }
    )
    .put(
        authenticate.verifyUser,
        authenticate.verifyAdmin,
        (req, res, next) => {
            res.statusCode = 403;
            res.end("PUT operation not supported ");
        }
    )
    .delete(
        authenticate.verifyUser,
        authenticate.verifyAdmin,
        (req, res, next) => {
            res.statusCode = 403;
            res.end("PUT operation not supported");
        }
    );

router
    .route("/:blogId")
    .get(authenticate.verifyUser, (req, res, next) => {
        Blog.findById(req.params.blogId)
            // .populate("comments.author")
            .then(
                (blog) => {
                    res.statusCode = 200;
                    res.setHeader("Content-Type", "application/json");
                    res.json(blog);
                },
                (err) => next(err)
            )
            .catch((err) => next(err));
    })
    .post(
        authenticate.verifyUser,
        authenticate.verifyAdmin,
        (req, res, next) => {
            res.statusCode = 403;
            res.end("POST operation not supported ");
        }
    )
    .put(
        authenticate.verifyUser,
        authenticate.verifyAdmin,
        (req, res, next) => {
            Blog.findByIdAndUpdate(
                req.params.blogId,
                {
                    $set: req.body,
                },
                { new: true }
            )
                .then(
                    (blog) => {
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(blog);
                    },
                    (err) => next(err)
                )
                .catch((err) => next(err));
        }
    )
    .delete(
        authenticate.verifyUser,
        authenticate.verifyAdmin,
        (req, res, next) => {
            Blog.findByIdAndRemove(req.params.blogId)
                .then(
                    (blog) => {
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(blog);
                    },
                    (err) => next(err)
                )
                .catch((err) => next(err));
        }
    );

module.exports = router;
