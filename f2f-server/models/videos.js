const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const video = new Schema(
    {
        videoTitle: {
            type: String,
            required: true,
        },
        videoDesc: {
            type: String,
            required: true,
        },
        videoLink: {
            type: String,
            required: true,
        },
        videoChannel: {
            type: String,
            required: true,
        },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Video", video);
