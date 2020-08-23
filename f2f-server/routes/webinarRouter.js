const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const authenticate = require("../authenticate");

const Webinar = require("../models/webinars");

const router = express.Router();

router.use(bodyParser.json());

router
    .route("/")
    .get(
        authenticate.verifyUser,
        // authenticate.verifyAdmin,
        (req, res, next) => {
            // res.send("respond with a resource");
            Webinar.find({})
                .then(
                    (webinar) => {
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(webinar);
                    },
                    (err) => next(err)
                )
                .catch((err) => next(err));
        }
    )
    .post(authenticate.verifyUser, (req, res, next) => {
        if (req.body != null) {
            req.body.author = req.user._id;
            Webinar.create(req.body)
                .then(
                    (webinar) => {
                        Webinar.findById(webinar.id)
                            .populate("author")
                            .then((webinar) => {
                                res.statusCode = 200;
                                res.setHeader(
                                    "Content-Type",
                                    "application/json"
                                );
                                res.json(webinar);
                            });
                    },
                    (err) => next(err)
                )
                .catch((err) => next(err));
        } else {
            err = new Error("Webinar not found in request body");
            err.status = 404;
            return next(err);
        }
    })
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
    .route("/:webinarId")
    .get(authenticate.verifyUser, (req, res, next) => {
        Webinar.findById(req.params.webinarId)
            .populate("author")
            .then(
                (webinar) => {
                    res.statusCode = 200;
                    res.setHeader("Content-Type", "application/json");
                    res.json(webinar);
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
    .put(authenticate.verifyUser, (req, res, next) => {
        Webinar.findById(req.params.webinarId)
            .then(
                (webinar) => {
                    if (webinar != null) {
                        if (!webinar.author.equals(req.user._id)) {
                            var err = new Error(
                                "You are not authorized to update this webinar!"
                            );
                            err.status = 403;
                            return next(err);
                        }
                        req.body.author = req.user._id;
                        Webinar.findByIdAndUpdate(
                            req.params.webinarId,
                            {
                                $set: req.body,
                            },
                            { new: true }
                        ).then(
                            (webinar) => {
                                Webinar.findById(webinar)
                                    .populate("author")
                                    .then((webinar) => {
                                        res.statusCode = 200;
                                        res.setHeader(
                                            "Content-Type",
                                            "application/json"
                                        );
                                        res.json(webinar);
                                    });
                            },
                            (err) => next(err)
                        );
                    } else {
                        err = new Error(
                            "Webinar " + req.params.commentId + " not found"
                        );
                        err.status = 404;
                        return next(err);
                    }
                },
                (err) => next(err)
            )
            .catch((err) => next(err));
    })
    // .put(
    //     authenticate.verifyUser,
    //     authenticate.verifyAdmin,
    //     (req, res, next) => {
    //         Webinar.findByIdAndUpdate(
    //             req.params.webinarId,
    //             {
    //                 $set: req.body,
    //             },
    //             { new: true }
    //         )
    //             .then(
    //                 (webinar) => {
    //                     res.statusCode = 200;
    //                     res.setHeader("Content-Type", "application/json");
    //                     res.json(webinar);
    //                 },
    //                 (err) => next(err)
    //             )
    //             .catch((err) => next(err));
    //     }
    // )
    .delete(
        authenticate.verifyUser,
        authenticate.verifyAdmin,
        (req, res, next) => {
            Webinar.findById(req.params.webinarId)
                .then(
                    (webinar) => {
                        if (webinar != null) {
                            if (!webinar.author.equals(req.user._id)) {
                                var err = new Error(
                                    "You are not authorized to update this comment!"
                                );
                                err.status = 403;
                                return next(err);
                            }
                            Webinar.findByIdAndRemove(
                                req.params.webinarId
                            ).then(
                                (webinar) => {
                                    res.statusCode = 200;
                                    res.setHeader(
                                        "Content-Type",
                                        "application/json"
                                    );
                                    res.json(webinar);
                                },
                                (err) => next(err)
                            );
                        } else {
                            err = new Error(
                                "Webinar " + req.params.commentId + " not found"
                            );
                            err.status = 404;
                            return next(err);
                        }
                    },
                    (err) => next(err)
                )
                .catch((err) => next(err));
        }
        // (req, res, next) => {
        //     Webinar.findByIdAndRemove(req.params.webinarId)
        //         .then(
        //             (webinar) => {
        //                 res.statusCode = 200;
        //                 res.setHeader("Content-Type", "application/json");
        //                 res.json(webinar);
        //             },
        //             (err) => next(err)
        //         )
        //         .catch((err) => next(err));
        // }
    );

module.exports = router;
