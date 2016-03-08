# Description:
#   Grab XKCD comic image urls
# 
# Commands:
#   hubot xkcd [latest]- The latest XKCD comic
#   hubot xkcd <num> - XKCD comic <num>
#   hubot xkcd random - XKCD comic <num>

module.exports = (robot) ->
  robot.respond /xkcd(\s+latest)?$/i, (msg) ->
    msg.http("http://xkcd.com/info.0.json")
      .get() (err, res, body) ->
        if res.statusCode == 404
          msg.send 'Comic not found.'
        else
          object = JSON.parse(body)
          msg.send object.title, object.img, object.alt

  robot.hear /closed a deal/i, (msg) ->
    msg.http("http://xkcd.com/info.0.json")
      .get() (err, res, body) ->
        if res.statusCode == 404
          msg.send 'Comic not found.'
        else
          object = JSON.parse(body)
          msg.send object.title, object.img, object.alt

