const express = require("express");
const bodyParser = require("body-parser");
const Workout = require("../models/workouts");
var authenticate = require("../authenticate");
const router = express.Router();

router.options("*", (req, res) => {
    res.sendStatus(200);
});
router
    .route("/")
    .get(
        authenticate.verifyUser,
        // authenticate.verifyAdmin,
        (req, res, next) => {
            // res.send("respond with a resource");
            Workout.find({})
                .then(
                    (workouts) => {
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(workouts);
                    },
                    (err) => next(err)
                )
                .catch((err) => next(err));
        }
    )
    .post(
        authenticate.verifyUser,
        authenticate.verifyAdmin,
        (req, res, next) => {
            Workout.create(req.body)
                .then(
                    (workout) => {
                        console.log("Dish Created ", workout);
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(workout);
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
    .route("/:workoutId")
    .get(authenticate.verifyUser, (req, res, next) => {
        Workout.findById(req.params.workoutId)
            .then(
                (workout) => {
                    res.statusCode = 200;
                    res.setHeader("Content-Type", "application/json");
                    res.json(workout);
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
            Workout.findByIdAndUpdate(
                req.params.workoutId,
                {
                    $set: req.body,
                },
                { new: true }
            )
                .then(
                    (workout) => {
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(workout);
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
            Workout.findByIdAndRemove(req.params.workoutId)
                .then(
                    (workout) => {
                        res.statusCode = 200;
                        res.setHeader("Content-Type", "application/json");
                        res.json(workout);
                    },
                    (err) => next(err)
                )
                .catch((err) => next(err));
        }
    );

module.exports = router;
