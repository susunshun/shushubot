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

cronJob = require('cron').CronJob

module.exports = (robot) ->
    cronjob = new cronJob(
        cronTime: "* * * * * *"     # 実行時間
        start:    true              # すぐにcronのjobを実行するか
        timeZone: "Asia/Tokyo"      # タイムゾーン指定
        onTick: ->                  # 時間が来た時に実行する処理
            d = new Date
            min = d.getMinutes()
            sec = d.getSeconds()
            message = "#{sec}secなう！"
#            robot.messageRoom process.env.HUBOT_TWITTER_MENTION_ROOM, message
            robot.send {room: "#ROOM_NAME_HERE"}, "#{sec}秒なう！"
    )
