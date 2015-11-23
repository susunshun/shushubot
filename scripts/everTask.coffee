cronJob = require('cron').CronJob

module.exports = (robot) ->
    cronjob = new cronJob(
#        cronTime: "0 0 9,12,15,19 * * *" # 秒 分 時・・・
        cronTime: "0,10,20,30,40,50 * * * * *" # デバッグ用タスク
        start:    true              # すぐにcronのjobを実行するか
        timeZone: "Asia/Tokyo"
        onTick: ->                  
            request = robot.http("https://everapi.herokuapp.com/random")
                           .get()
            request (err, res, body) ->
                json = JSON.parse body
                title = json['title']
                url = json['url']
                d = new Date
                message = "Hello, now it is #{d.getHours()}:#{d.getMinutes()}. Remind evertnote / #{title}： #{url}"
                robot.send {user:{user:'susunshun_o'},screen_name:'susunshun_o', room: 'Twitter'},message
    )
