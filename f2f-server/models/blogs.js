const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const blog = new Schema(
    {
        blogTitle: { type: String, required: true },
        blogShortDesc: { type: String, required: true },
        blogLink: { type: String, required: true },
        blogAuthor: { type: String, required: true },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Blog", blog);
