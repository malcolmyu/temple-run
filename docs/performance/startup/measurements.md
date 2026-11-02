# 冷加载测量结果

每组三轮；时间单位毫秒，字节含HTML及浏览器估算响应头。原始记录在raw/。

|组别|开始按钮可用|可玩TTI|FCP|首屏字节|请求数|
|---|---:|---:|---:|---:|---:|
|controlledBeforeFast|22,218.9|22,327.0|756.0|4,056,515.0|36.0|
|controlledAfterFast|2,614.3|2,679.1|628.0|376,717.0|13.0|
|controlledBeforeSlow|25,801.3|25,860.1|1,572.0|4,056,515.0|36.0|
|controlledAfterSlow|3,623.9|3,686.8|1,424.0|376,717.0|13.0|
|publicBeforeFast|25,149.7|25,220.6|3,120.0|4,074,145.0|36.0|

## 每轮可玩TTI

- controlledBeforeFast：22327.0, 22581.9, 22116.0
- controlledAfterFast：3014.2, 2521.0, 2679.1
- controlledBeforeSlow：25828.5, 25860.1, 25911.0
- controlledAfterSlow：3686.8, 3693.6, 3684.0
- publicBeforeFast：31567.6, 25220.6, 23391.2
