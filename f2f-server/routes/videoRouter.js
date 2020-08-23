const express = require("express");
// const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const authenticate = require("../authenticate");

const Video = require("../models/videos");

const router = express.Router();

router
    .route("/")
    .get(authenticate.verifyUser, (req, res, next) => {
        Video.find({})
            .then(
                (video) => {
                    res.statusCode = 200;
                    res.setHeader("Content-Type", "application/json");
                    res.json(video);
                },
                (err) => next(err)
            )
            .catch((err) => next(err));
    })
    .post(
        authenticate.verifyUser,
        authenticate.verifyAdmin,
        (req, res, next) => {
            Video.create(req.body)
                .then(
                    (video) => {
                        console.log("Video Created ", video);
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(video);
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
    .route("/:videoId")
    .get(authenticate.verifyUser, (req, res, next) => {
        Video.findById(req.params.videoId)
            // .populate("comments.author")
            .then(
                (video) => {
                    res.statusCode = 200;
                    res.setHeader("Content-Type", "application/json");
                    res.json(video);
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
            Video.findByIdAndUpdate(
                req.params.videoId,
                {
                    $set: req.body,
                },
                { new: true }
            )
                .then(
                    (video) => {
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(video);
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
            Video.findByIdAndRemove(req.params.videoId)
                .then(
                    (video) => {
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(video);
                    },
                    (err) => next(err)
                )
                .catch((err) => next(err));
        }
    );

module.exports = router;
