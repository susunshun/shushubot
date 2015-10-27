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
