const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const passportLocalMongoose = require("passport-local-mongoose");

var User = new Schema({
    mobileNo: {
        type: String,
        // min: 1000000000,
        // max: 9999999999,
        // required: true,
        default: "",
    },
    firstname: {
        type: String,
        default: "",
    },
    lastname: {
        type: String,
        default: "",
    },
    admin: {
        type: Boolean,
        default: false,
    },
});

User.plugin(passportLocalMongoose);

module.exports = mongoose.model("User", User);
