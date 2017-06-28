'use strict';

var url = require('url');

var Ping = require('./PingService');

module.exports.ping = function ping (req, res, next) {
  Ping.ping(req.swagger.params, res, next);
};
