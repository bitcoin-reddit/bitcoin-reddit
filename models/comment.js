var db = require('../db');
var query = db.query;



exports.create = function (comment, callback) {
    // insert user
    var sql = 'INSERT INTO "comments" (text, forum, username, parent, timestamp) VALUES ($1, $2, $3, $4, $5);';
    var values = [comment.text, comment.forum, comment.username, comment.parent, comment.timestamp];

    query(sql, values, function(err, res) {
        callback(err, res ? res.rows : null)
    });

};



