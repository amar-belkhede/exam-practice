const mongoose = require("mongoose");
const Schema = mongoose.Schema;
require("mongoose-currency").loadType(mongoose);
const Currency = mongoose.Types.Currency;

const workout = new Schema(
    {
        workoutBookName: {
            type: String,
            required: true,
        },
        workoutBookShortDetail: {
            type: String,
            required: true,
        },
        workoutAuthorName: {
            type: String,
            required: true,
        },
        workoutBookPrice: {
            type: Currency,
            required: true,
            min: 0,
        },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Workout", workout);
