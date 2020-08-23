const mongoose = require("mongoose");
const Schema = mongoose.Schema;
require("mongoose-currency").loadType(mongoose);
const Currency = mongoose.Types.Currency;

const webinar = new Schema(
    {
        webinarTitle: {
            type: String,
            required: true,
        },
        webinarShortDetail: {
            type: String,
            required: true,
        },
        webinarPrice: {
            type: Currency,
            required: true,
            min: 0,
        },
        webinarDate: {
            type: Date,
            default: Date,
            min: Date,
        },
        author: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "User",
        },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Webinars", webinar);
