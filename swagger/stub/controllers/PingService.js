'use strict';

exports.ping = function(args, res, next) {
  /**
   * ping endpoint
   *
   * returns inline_response_200
   **/
  var examples = {};
  examples['application/json'] = {
  "message" : "pong"
};
  if (Object.keys(examples).length > 0) {
    res.setHeader('Content-Type', 'application/json');
    res.end(JSON.stringify(examples[Object.keys(examples)[0]] || {}, null, 2));
  } else {
    res.end();
  }
}

