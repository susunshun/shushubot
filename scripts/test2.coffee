module.exports = (robot) ->
    robot.respond /おきろ/i, (msg) ->
        msg.send "あと５分だけ"

    # 正規表現でマッチングした部分の取得もできる
    robot.respond /I am (.*)/i, (msg) ->
        msg.send "Hi, #{msg.match[1]}"

    # 時間を答える 
    robot.respond /いまなんじ？/i, (msg) ->
        d = new Date
        hour = d.getHours()
        min   = d.getMinutes()
        sec   = d.getSeconds()
        msg.send " #{hour}時#{min}分#{sec}秒"

    robot.respond /(.*)の天気は？/i, (msg) ->
        request = robot.http("http://api.openweathermap.org/data/2.5/weather?q=#{msg.match[1]}&appid=119543b8a3d18b744152cca11545029c")
                       .query(address: msg.match[1])
                       .get()
        request (err, res, body) ->
            json = JSON.parse body
            name = json['name']
            weather = json['weather'][0]['main']
            msg.send "#{name}の天気は #{weather}"
